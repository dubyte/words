---
name: write-novel-init
description: Initialize a new novel project with complete directory structure and Git repository.
---
# Write Novel - Initialize Project

## Purpose
Initialize a new novel project with complete directory structure and Git repository.

## Behavior

### 1. Project Name Resolution
- If user provides a name: Use it (e.g., "my-fantasy-novel")
- If no name provided: **Prompt the user for the project name.** Do not auto-generate a name. Wait for the user to provide a valid project name (in kebab-case) before proceeding.

### 2. Project Name Validation
- Name must be a valid directory name
- Reject reserved names: CON, PRN, AUX, NUL, COM1-9, LPT1-9 (Windows reserved)
- Reject names starting with "." (hidden)
- Allow: alphanumeric characters, hyphens, underscores
- If invalid: Error "'[name]' is not a valid project name. Use alphanumeric characters, hyphens, or underscores."

### 3. Directory & Git Validation
- Working directory must be the repo root (where `.git/` lives)
- Check if a Git branch named `[project-name]` already exists:
  - If exists: Error "Branch '[name]' already exists. Use `write-novel-use` to continue or pick a different name."
- Check if project folder `[project-name]/` already exists:
  - If exists: Error "Project '[name]' already exists. Choose a different name or use write-novel-rename."
- If not exists: Proceed

### 4. Git Branch Creation
- Create and check out a new branch named exactly `[project-name]`:
  ```bash
  git checkout -b [project-name]
  ```
- **All subsequent work for this novel happens on this branch.**

### 5. Project Structure Creation
Create the following structure in a **relative** folder `[project-name]/` (never use absolute paths):

```
[project-name]/
├── README.md               # Project overview and TODO list
├── metadata/
│   ├── genre.md           # (empty initially)
│   ├── target_audience.md # (empty initially)
│   ├── themes.md          # (empty initially)
│   ├── language.md        # (empty initially)
│   ├── author.md          # (empty initially)
│   └── banned_tropes.md   # Rules for avoiding AI clichés
├── world/
│   ├── overview.md        # (empty initially)
│   ├── geography.md       # (empty initially)
│   ├── magic_system.md    # (empty initially)
│   ├── notes.md           # Essential (cast/factions list)
│   ├── factions/          # (directory)
│   └── cultures/          # (directory)
├── characters/
│   ├── protagonist.md     # (empty initially)
│   ├── antagonist.md      # (empty initially)
│   └── side/              # (directory for side characters)
├── plot/
│   ├── high_level_summary.md     # (empty initially)
│   ├── database.json      # Structured JSON version of continuity tracker
│   └── chapter_outlines/  # (directory)
├── chapters/              # (directory for drafts)
└── appendix/
    └── inspiration.md     # (empty initially)
```

**Note**: `history.md` is NOT created in Phase 1 as it's an optional Phase 3 element. `notes.md` is added as it's an essential world building element.

### 6. Mode, Language, and Author Selection (ESSENTIAL)

After creating the structure, ask the user to choose a writing mode:

```
📝 Choose your writing mode for [project-name]:

A — author (You write, AI assists)
  • You write all prose. AI interviews, organizes, tracks continuity.
  • AI creates AGENTS.md context files to remind you of details.
  • Best if: You enjoy writing and want a smart assistant.

B — co-writer (AI writes, you direct)
  • You give direction, constraints, and feedback.
  • AI generates prose, scenes, and dialogue.
  • Best if: You want to focus on story, not typing every sentence.

C — synthfic (AI writes autonomously in batches)
  • You set up the detailed outline and world data.
  • AI writes chapter after chapter autonomously based on established data.
  • Best if: You want to produce large amounts of text using predefined lore.

💡 You can switch anytime with skill(name="write-novel-mode")
```

Write the choice to `metadata/writing_mode.md` (content is just `author`, `co-writer`, or `synthfic`).

Next, ask the user to specify the language and region for the project:

```
🌍 What language and region will this novel be written in?
Examples: English (US), English (UK), Spanish (MX), Spanish (Spain), etc.
```

Write the choice to `metadata/language.md`.

**CRITICAL RULE FOR ALL SKILLS**: Once the language is locked in `metadata/language.md`, all drafted prose and generated content MUST be written in that language. However, the filenames and folder structure (e.g., `characters/`, `world/`, `metadata/`) MUST remain in English so they do not interfere with the skills or system functionality.

Finally, ask the user for the author's name:

```
✍️  What is the author's name for this novel?
```

Write the name to `metadata/author.md`.

### 7. .gitignore Template
Create `.gitignore` inside `[project-name]/` with:

```
# Novel project meta files
.ai/.current_project
*.tmp
*.bak
.DS_Store
```

### 8. Git Commit
- Stage the new folder: `git add [project-name]/`
- Commit from the repo root: `git commit -m "Initial commit: Project structure for '[project-name]'"`
- **All paths in commands must be relative to the repo root. Never use absolute paths.**

### 9. Auto-Select Option
After successful creation, ask user:
```
✅ Project '[name]' created successfully!

📁 Location: ./[project-name]/
🌿 Branch: [project-name]

❓ Set '[name]' as current project? (y/n)
```

If yes: Automatically run equivalent of `write-novel-use [name]`

### 10. Output
- Success message: "✅ Project '[name]' created successfully!"
- Display relative project path and active branch
- Next step: "Run `write-novel-foundations` to begin developing your novel's foundations."
- If auto-selected: "This project is now set as current. You can run skills without specifying the project name."

## Usage Examples

```bash
# With specific kebab-case name
skill(name="write-novel-init", user_message="my-fantasy-novel")
# Creates branch my-fantasy-novel, folder ./my-fantasy-novel/

# Without name
skill(name="write-novel-init")
# Result: Agent prompts user: "What would you like to name your novel project (in kebab-case)?"
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root (where .git/ is located)."
- Invalid project name: "Error: '[name]' is not a valid project name. Use alphanumeric characters, hyphens, or underscores."
- Reserved name: "Error: '[name]' is a reserved system name. Choose a different name."
- Duplicate folder: "Error: Project '[name]' already exists. Choose a different name or use write-novel-rename."
- Duplicate branch: "Error: Branch '[name]' already exists. Use `write-novel-use` to continue or pick a different name."
- Git branch creation failed: "⚠️ Warning: Git branch creation failed. Project not created."
- Git commit failed: "⚠️ Warning: Initial commit failed. Files are staged but not committed."

## Dependencies
- Requires `git` to be installed
- Requires write access to working directory
