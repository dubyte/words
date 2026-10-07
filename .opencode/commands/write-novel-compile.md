---
description: Compile draft chapters into a formatted e-book (EPUB). Use when you want to export the novel or generate a preview.
---
Compile draft chapters into a formatted e-book (EPUB) for reading, sharing, or publishing preparation.

Arguments: project name + optional flags, e.g. `$ARGUMENTS` → `MyNovel --preview` or `MyNovel --chapters 1-5`.

## Steps

### 1. Directory & Project Validation
- Run `.ai/scripts/novel-env.sh` (pass the project name if provided) — prints `NOVEL`, `NOVEL_DIR`, `REPO_ROOT`, resolving correctly in both a normal clone and a bare-repo + worktrees checkout. If it fails, list projects and prompt.
- Check `$NOVEL_DIR/chapters/` has draft files.
- If no drafts: "Error: No draft chapters found. Write some chapters first with /write-novel-draft".

### 2. Compilation Modes
```
📚 Compilation Mode

1. Full Book - Compile all [N] chapters
2. Preview - Compile first 3 chapters (quick sample)
3. Custom Range - Compile chapters X to Y
```
Default: Full. `--preview` → Preview, `--chapters X-Y` → Custom.

### 3. Metadata Collection
Check in this order:
1. **`metadata.yaml`** in project root → use `--metadata-file=metadata.yaml` (all fields preserved). This is the source of truth; skip gathering.
2. **`metadata.xml`** → use `--epub-metadata=metadata.xml`. ⚠️ Pandoc 3.7+ only reliably reads `dc:date` and `dc:language`; still pass title/author/subject/description/publisher/rights via `--metadata` flags.
3. **Neither** → gather from `/metadata/` files and README, then create `metadata.yaml`:
   - Title: project name or README, or prompt
   - Author: `/metadata/author.md` or prompt
   - Language: `/metadata/language.md` or default "en"
   - Description: `/plot/high_level_summary.md` or prompt
   - Genre/Subject: `/metadata/genre.md` or prompt
   - Publication Date: default today
   - Publisher: prompt or default "Self-published"
   - Rights: prompt or default "Copyright [Year] [Author]"

**Cover image (optional):** check `/cover.jpg`, `/cover.png`, or `/assets/cover.*`. If missing, warn and compile without cover.

### 4. Chapter Ordering
- Scan `/chapters/` for subdirectories; find all `chapter_*/draft.md` (zero-padded: chapter_001, chapter_002...).
- Sort numerically: `ls -d chapters/chapter_* | sort -t'_' -k2,2n -k3,3`.
- Handle split chapters (e.g. chapter_046a, chapter_046b).
- Show the chapter list and offer: compile in order / reorder / exclude / add front matter (dedication, prologue) / add back matter (epilogue, acknowledgments).
- Note missing chapter numbers (e.g. "Chapter 4 appears to be missing between chapters 3 and 5").

### 5. EPUB Generation (pandoc)

Write chapter paths to a temp file, then compile via xargs (shell-agnostic, handles large file counts):

```bash
# 1. Generate sorted chapter list
ls -d chapters/chapter_* | sort -t'_' -k2,2n -k3,3 \
  | while read d; do f="$d/draft.md"; [ -f "$f" ] && echo "$f"; done > /tmp/chapters.txt

# 2. Compile (metadata.yaml present — recommended path)
xargs -a /tmp/chapters.txt pandoc \
  --from=markdown \
  --metadata-file=metadata.yaml \
  --epub-cover-image=assets/cover.png \
  --toc --toc-depth=2 \
  -o exports/output.epub
```

If only `metadata.xml` exists, add `--epub-metadata=metadata.xml` plus `--metadata` flags for title/author/lang/date/subject/description/publisher/rights. If neither exists, create `metadata.yaml` from the gathered data first, then compile as above.

**Include options:** title page (always), table of contents (always, auto-generated), optional dedication (`/dedication.md`), prologue (`/prologue.md`), epilogue (`/epilogue.md`), acknowledgments (`/acknowledgments.md`), about the author (`/about_author.md`).

**Chapter headers:** add `# Chapter [N]` if missing.

### 6. Output Location
- Default: `./[project-name]/exports/`
- Filename: `[ProjectName]_v[version]_[date].epub`; preview: `[ProjectName]_PREVIEW_[date].epub`

### 7. Post-Compilation Output
```
✅ Novel compiled successfully!

📚 Book Details:
   Title: [Title]
   Author: [Author]
   Chapters: [N]
   Word Count: [X]
   Format: EPUB

📁 File Location:
   ./[project]/exports/[filename].epub

📝 Included:
   ✓ Title page
   ✓ Table of contents
   ✓ Chapter 1-12
   ✓ About the author

💡 Next Steps:
   1. Read on your e-reader
   2. Share with beta readers
   3. Convert to other formats (see below)
   4. Publish to platforms (Amazon, Kobo, etc.)
```

**Preview output** uses `[ProjectName]_PREVIEW_` filename and reports "Chapters: 1-3 (of [Total])".

### 8. Converting to Other Formats (optional)
Use Calibre's `ebook-convert` if installed: `ebook-convert MyNovel.epub MyNovel.mobi` (Kindle MOBI), `.azw3` (newer Kindle), `.pdf`. `pandoc MyNovel.epub -o MyNovel.pdf` also works if a LaTeX engine is installed.

## Fan Fiction / AI-Generated Works
When the novel is fan fiction or AI-generated (not original work by the attributed author):
- **Author credit**: Use your own name/pseudonym, "Anónimo", or "Generado por IA"
- **Description**: Include disclaimer: "Fan fiction no oficial del universo [original]. Generado con asistencia de IA. No afiliado ni respaldado por el autor original."
- **Rights**: Note original IP ownership: "Fan fiction — personajes y universo pertenecen a [original author]"

## Error Handling
- No pandoc: "Error: pandoc not installed. Install with: sudo apt-get install pandoc (Debian/Ubuntu), sudo dnf install pandoc (Fedora), sudo pacman -S pandoc (Arch), or brew install pandoc (macOS)"
- No drafts: "Error: No draft chapters found in /chapters/"
- No project: "Error: Project '[name]' does not exist"
- Cover not found: "Warning: No cover image found. Compiling without cover."
- Ordering issues: "Note: Chapter 4 appears to be missing between chapters 3 and 5"

Requires `pandoc`. Calibre (`ebook-convert`) optional for MOBI/AZW3/PDF.
