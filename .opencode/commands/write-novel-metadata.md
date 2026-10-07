---
description: Update book metadata for EPUB compilation. Use when you need to set or change the book's title, author, genre, or other publication metadata.
---
Manage the compiled metadata file used by `/write-novel-compile` for EPUB generation. Defaults to YAML (full pandoc support). XML is available only as a legacy fallback.

Project name: $ARGUMENTS (optional).

## Steps

### 1. Project Validation
- Run `.ai/scripts/novel-env.sh` (pass the project name if provided) — prints `NOVEL`, `NOVEL_DIR`, `REPO_ROOT`, resolving correctly in both a normal clone and a bare-repo + worktrees checkout.
- If `$NOVEL_DIR` doesn't exist: "Error: Project '$NOVEL' does not exist. Run /write-novel-init first."

### 2. Read Current Metadata
Pre-fill current values in this priority order:
1. `metadata.yaml` — parse existing YAML fields
2. `metadata.xml` — parse `<dc:*>` elements
3. `/metadata/` files:
   - `author.md` → author
   - `language.md` → lang
   - `genre.md` → subject (extract primary genre line)
4. `README.md` or project folder name → title
5. `/plot/high_level_summary.md` → description

### 3. Display Current Metadata
```
📋 Current Metadata for [Project]:

Title:       [value]
Author:      [value]
Date:        [value]
Language:    [value]
Genre:       [value]
Description: [value]
Publisher:   [value]
Rights:      [value]
```

### 4. Prompt for Updates
Ask which fields to change. Accept blank to keep the current value.

Fields managed: **title**, **author**, **lang** (default "en" if blank), **subject** (genre), **description**, **publisher** (default "Self-published"), **rights** (default "Copyright [year] [author]").

**Date handling:** after other fields, ask:
```
📅 Update publication date? Current: [current date]
1. Yes — update to today ([YYYY-MM-DD])
2. No — keep current date
3. Custom — enter a specific date
```
Default to option 1 (today).

### 5. Format Selection
```
💾 Save format:

1. YAML (recommended) — all fields preserved by pandoc
2. XML (legacy) — limited support, some fields may be lost
```
Default to YAML. Warn when choosing XML: "Pandoc 3.7+ only reliably reads date and language from XML. Title, author, and other fields may be lost. Use YAML to preserve all metadata."

### 6. Write File

**YAML** → write `metadata.yaml` in project root:
```yaml
---
title: "[Title]"
author: "[Author]"
date: "[YYYY-MM-DD]"
lang: "[language]"
subject: "[Genre]"
description: "[Description]"
publisher: "[Publisher]"
rights: "[Rights]"
```

**XML** → write `metadata.xml` in project root:
```xml
<metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
  <dc:title>[Title]</dc:title>
  <dc:creator>[Author]</dc:creator>
  <dc:language>[language]</dc:language>
  <dc:date>[YYYY-MM-DD]</dc:date>
  <dc:description>[Description]</dc:description>
  <dc:subject>[Genre]</dc:subject>
  <dc:publisher>[Publisher]</dc:publisher>
  <dc:rights>[Rights]</dc:rights>
</metadata>
```

### 7. Git Operations
- `git add metadata.yaml` (or `metadata.xml`)
- `git commit -m "chore: update book metadata for [project-name]"`

### 8. Output
```
✅ Metadata updated for [Project]

📁 File written:
   metadata.yaml (or metadata.xml)

📋 Fields set:
   Title:    [value]
   ...

⏭️ Next: Run /write-novel-compile to build the EPUB
```

## Notes
- Keep `metadata.yaml` under version control so compile is reproducible.
- If you edit `/metadata/` files (e.g. change genre in `genre.md`), run this command again to update `metadata.yaml`.
- Do not commit `metadata.yaml` to `main` — it belongs on the novel branch.
