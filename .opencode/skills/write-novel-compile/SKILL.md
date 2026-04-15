# Write Novel - Compile & Export

## Purpose
Compile draft chapters into a formatted e-book (EPUB format) for reading, sharing, or publishing preparation.

## Behavior

### 1. Directory Validation
- Working directory must be: `/home/dubyte/Documents/Workspace/words/`
- Check if project exists
- Check if drafts exist (`/chapters/` has content)

### 2. Project Selection
1. **If project name provided**: Use that project
2. **If no project name**: Check for stored current project in `.opencode/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Validation
- Check if `/chapters/` directory has draft files
- If no drafts: Error "No draft chapters found. Write some chapters first with write-novel-draft"
- Check which chapters have drafts

### 4. Compilation Modes

**Three compilation modes:**
1. **Full** - Compile all chapters (default)
2. **Preview** - Compile first 3 chapters only
3. **Custom** - Compile specific chapter range

**Prompt user:**
```
📚 Compilation Mode

1. Full Book - Compile all [N] chapters
2. Preview - Compile first 3 chapters (quick sample)
3. Custom Range - Compile chapters X to Y

Your choice:
```

### 5. Metadata Collection

Gather book metadata (can be auto-filled from existing files):

**From `/metadata/` and README:**
- **Title**: From project name or README, or prompt user
- **Author**: Prompt user (or use system user)
- **Language**: Default "en" or prompt
- **Description**: From `/plot/high_level_summary.md` or prompt
- **Genre**: From `/metadata/genre.md` or prompt
- **Tags/Keywords**: Optional
- **Publication Date**: Default today

**Cover Image (Optional):**
- Check for `/cover.jpg`, `/cover.png`, or `/assets/cover.*`
- If found: Use it
- If not: Offer to proceed without cover or prompt for path

### 6. Chapter Ordering

**Discover chapters:**
- Scan `/chapters/` directory
- Find all `chapter_*_draft.md` or `draft.md` files
- Sort numerically (chapter_01, chapter_02, etc.)

**Allow reordering:**
```
Chapters found:
1. Chapter 1 - Opening Scene
2. Chapter 2 - The Journey Begins
3. Chapter 3 - First Conflict
4. Chapter 5 - (Chapter 4 seems missing)

Options:
1. Compile in current order
2. Reorder chapters
3. Exclude specific chapters
4. Add front matter (dedication, prologue)
5. Add back matter (epilogue, acknowledgments)
```

### 7. Compilation Options

**Format Selection:**
- EPUB (default, universal e-book format)

**Styling Options:**
- Use default stylesheet
- Custom CSS (if `/assets/style.css` exists)
- Font preferences
- Chapter heading style

**Include Options:**
- [x] Title page
- [x] Table of contents
- [ ] Dedication
- [ ] Prologue
- [ ] Epilogue
- [x] Author notes

### 8. Front Matter & Back Matter

**Front Matter (Before Chapter 1):**
- Title page (always)
- Copyright page (optional)
- Dedication (optional, from `/dedication.md`)
- Table of contents (always, auto-generated)
- Prologue (optional, from `/prologue.md`)

**Back Matter (After last chapter):**
- Epilogue (optional, from `/epilogue.md`)
- Acknowledgments (optional, from `/acknowledgments.md`)
- About the author (optional, from `/about_author.md`)

### 9. Markdown Processing

**Pre-processing steps:**
1. Combine all chapter files in order
2. Add chapter headers (if not present)
3. Convert relative links
4. Handle images (copy to EPUB)
5. Clean up formatting

**Chapter Header Format:**
```markdown
# Chapter 1

## The Beginning

Content here...
```

**Auto-add if missing:**
```markdown
# Chapter [N]

[Existing content]
```

### 10. EPUB Generation

**Using pandoc (recommended):**
```bash
pandoc \
  --epub-metadata=metadata.xml \
  --epub-cover-image=cover.jpg \
  --css=style.css \
  --toc \
  --toc-depth=2 \
  -o output.epub \
  title_page.md \
  dedication.md \
  chapter_01.md \
  chapter_02.md \
  ...
```

**Alternative: Python ebooklib:**
- Create EPUB book object
- Add metadata
- Add cover image
- Add chapters as HTML
- Set stylesheet
- Write EPUB file

### 11. Preview Mode

**Generate sample EPUB with just first 3 chapters:**

Useful for:
- Quick preview of formatting
- Sharing early sample with beta readers
- Testing compilation without full book
- Marketing/teaser

**Preview output:**
```
✅ Preview compiled successfully!

📚 Preview Details:
   Title: [Title] (Preview)
   Chapters: 1-3 (of [Total])
   Word Count: [X] words
   Format: EPUB

📁 File Location:
   /home/dubyte/Documents/Workspace/words/[project]/exports/[filename]_PREVIEW.epub

💡 This is a sample of your first 3 chapters.
   Perfect for testing formatting or sharing a teaser!
```

**Preview filename:** `[ProjectName]_PREVIEW_[date].epub`

### 12. Output Location

**Default:** `/home/dubyte/Documents/Workspace/words/[project-name]/exports/`

**Filename format:** `[ProjectName]_v[version]_[date].epub`

Examples:
- `MyNovel_v1_2024-01-15.epub`
- `MyNovel_v2_2024-02-20.epub`
- `TheCrystalThrone_FINAL.epub`
- `MyNovel_PREVIEW_2024-01-15.epub` (preview mode)

### 13. Version Tracking

**Track compilations in:** `.opencode/compile_history_[project].md`

```
[Project Name] - Compile History

2024-01-15 14:30: MyNovel_v1_2024-01-15.epub
  - Chapters: 1-5
  - Format: EPUB
  - Word count: 15,234
  - Status: First draft

2024-01-15 15:45: MyNovel_PREVIEW_2024-01-15.epub
  - Chapters: 1-3 (Preview)
  - Format: EPUB
  - Word count: 8,421
  - Status: Preview sample

2024-02-20 09:15: MyNovel_v2_2024-02-20.epub
  - Chapters: 1-12
  - Format: EPUB
  - Word count: 42,891
  - Status: Complete draft
```

### 14. Post-Compilation

**Success output:**
```
✅ Novel compiled successfully!

📚 Book Details:
   Title: [Title]
   Author: [Author]
   Chapters: [N]
   Word Count: [X]
   Format: EPUB

📁 File Location:
   /home/dubyte/Documents/Workspace/words/[project]/exports/[filename].epub

📝 Included:
   ✓ Title page
   ✓ Table of contents
   ✓ Chapter 1-12
   ✓ About the author

💡 Next Steps:
   1. Read on your e-reader
   2. Share with beta readers
   3. Convert to other formats (see instructions below)
   4. Publish to platforms (Amazon, Kobo, etc.)
```

**Options after compile:**
1. Open containing folder
2. Compile preview (first 3 chapters)
3. View compilation history
4. Compile again with different options

## Usage Examples

```bash
# Compile current project with defaults (full book)
skill(name="write-novel-compile")

# Compile specific project
skill(name="write-novel-compile", user_message="MyFantasyNovel")

# Compile with specific version name
skill(name="write-novel-compile", user_message="MyFantasyNovel v2-beta")

# Compile preview (first 3 chapters)
skill(name="write-novel-compile", user_message="MyFantasyNovel --preview")

# Compile custom range
skill(name="write-novel-compile", user_message="MyFantasyNovel --chapters 1-5")
```

## Converting to Other Formats

Your EPUB can be converted to other e-book formats using command-line tools:

### **Calibre's ebook-convert** (Recommended)

**Installation:**
```bash
# Debian/Ubuntu
sudo apt-get install calibre

# Fedora
sudo dnf install calibre

# Arch
sudo pacman -S calibre
```

**Convert to Kindle (MOBI):**
```bash
ebook-convert MyNovel.epub MyNovel.mobi
```

**Convert to Kindle (AZW3 - newer format):**
```bash
ebook-convert MyNovel.epub MyNovel.azw3
```

**Convert to PDF:**
```bash
ebook-convert MyNovel.epub MyNovel.pdf \
  --pdf-page-numbers \
  --pdf-header-template="[TITLE] - [AUTHOR]"
```

**Advanced conversion with options:**
```bash
# MOBI with cover
 ebook-convert MyNovel.epub MyNovel.mobi \
  --cover=cover.jpg \
  --title="My Novel Title" \
  --authors="Your Name"

# PDF for print
 ebook-convert MyNovel.epub MyNovel.pdf \
  --paper-size=a5 \
  --pdf-default-font-size=11 \
  --pdf-page-numbers
```

### **Pandoc (Alternative)**

If you prefer pandoc for PDF:
```bash
# Install dependencies first (Debian/Ubuntu)
sudo apt-get install texlive-latex-base texlive-fonts-recommended

# Or Fedora
sudo dnf install texlive-scheme-basic

# Convert to PDF
pandoc MyNovel.epub -o MyNovel.pdf
```

### **Online Converters**

If you don't want to install tools:
- **CloudConvert** - cloudconvert.com (supports EPUB → MOBI, AZW3, PDF)
- **Convertio** - convertio.co
- **Amazon KDP** - Upload EPUB directly, they convert to Kindle format

### **Quick Reference Card**

Save this for easy reference:
```bash
# Kindle (MOBI)
ebook-convert input.epub output.mobi

# Kindle (better format)
ebook-convert input.epub output.azw3

# PDF
ebook-convert input.epub output.pdf

# All three at once
ebook-convert input.epub output.mobi
ebook-convert input.epub output.azw3
ebook-convert input.epub output.pdf
```

## File Structure

```
MyNovel/
├── chapters/
│   ├── chapter_01/
│   │   └── draft.md
│   ├── chapter_02/
│   │   └── draft.md
│   └── ...
├── exports/                    # Compiled books
│   ├── MyNovel_v1_2024-01-15.epub
│   ├── MyNovel_v2_2024-02-20.epub
│   ├── MyNovel_PREVIEW_2024-01-15.epub
│   └── MyNovel_FINAL.mobi      # Converted to Kindle
├── assets/                     # Optional
│   ├── cover.jpg              # Book cover
│   └── style.css              # Custom styling
├── metadata/                   # Used for book info
│   ├── genre.md
│   └── ...
├── dedication.md              # Optional front matter
├── prologue.md                # Optional front matter
├── epilogue.md                # Optional back matter
├── acknowledgments.md         # Optional back matter
└── about_author.md            # Optional back matter
```

## Metadata XML Template

```xml
<?xml version="1.0" encoding="UTF-8"?>
<dc:title>[Title]</dc:title>
<dc:creator>[Author]</dc:creator>
<dc:language>[en]</dc:language>
<dc:date>[YYYY-MM-DD]</dc:date>
<dc:description>[Description]</dc:description>
<dc:subject>[Genre]</dc:subject>
<dc:publisher>[Publisher or Self-published]</dc:publisher>
<dc:rights>Copyright [Year] [Author]</dc:rights>
<dc:identifier id="bookid">[ISBN or UUID]</dc:identifier>
```

## Dependencies

**Required:**
- `pandoc` (for EPUB generation)

**Installation:**

**Debian/Ubuntu:**
```bash
sudo apt-get update
sudo apt-get install pandoc
```

**Fedora:**
```bash
sudo dnf install pandoc
```

**Arch Linux:**
```bash
sudo pacman -S pandoc
```

**macOS:**
```bash
brew install pandoc
```

**Optional (for converting to other formats):**
- `calibre` (for MOBI/AZW3/PDF conversion via ebook-convert)
  - Debian/Ubuntu: `sudo apt-get install calibre`
  - Fedora: `sudo dnf install calibre`
- `texlive` (for PDF generation via pandoc)
  - Debian/Ubuntu: `sudo apt-get install texlive-latex-base`
  - Fedora: `sudo dnf install texlive-scheme-basic`

## Error Handling

- No pandoc: "Error: pandoc not installed. Install with: sudo apt-get install pandoc (Debian/Ubuntu) or sudo dnf install pandoc (Fedora)"
- No drafts: "Error: No draft chapters found in /chapters/"
- No project: "Error: Project '[name]' does not exist"
- Cover image not found: "Warning: No cover image found. Compiling without cover."
- Chapter ordering issues: "Note: Chapter 4 appears to be missing between chapters 3 and 5"

## Integration with Other Skills

**write-novel-draft:**
- After drafting chapter, offer: "Compile preview of first 3 chapters to test formatting?"

**write-novel-status:**
- Show compile history
- "Last compiled: [date] with [N] chapters"
- "Last preview: [date]"

**write-novel-init:**
- Create `/assets/` folder for covers and styling

## Notes

- EPUB is the standard open e-book format
- Works with most e-readers (except older Kindle)
- Use Calibre's ebook-convert for Kindle format (MOBI/AZW3)
- Keep multiple versions (v1, v2, etc.) to track progress
- Compile frequently to see your progress as a real book
- Use Preview mode to test formatting without compiling entire book
- Reading your own EPUB helps catch issues
