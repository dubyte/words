---
description: Initialize a new novel project with complete directory structure and Git repository.
---
Initialize a new novel project with complete directory structure and Git repository.

Project name: $ARGUMENTS (optional). If not provided, prompt the user for a kebab-case project name — do not auto-generate one.

## Steps

### 1. Project Name Validation
- Name must be a valid directory name
- Reject reserved names: CON, PRN, AUX, NUL, COM1-9, LPT1-9
- Reject names starting with "." (hidden)
- Allow: alphanumeric characters, hyphens, underscores
- If invalid: "Error: '[name]' is not a valid project name. Use alphanumeric characters, hyphens, or underscores."

### 2. Directory & Git Validation
- Run `git rev-parse --show-toplevel` to confirm you're in a working tree (works in both a normal clone and a bare-repo + worktrees checkout). In a worktree layout, run this from the `main` worktree.
- If a git branch named `[project-name]` exists: "Error: Branch '[name]' already exists. Use `/write-novel-use` to continue or pick a different name."
- If project folder `[project-name]/` exists: "Error: Project '[name]' already exists. Choose a different name or use /write-novel-rename."

### 3. Git Branch Creation
- `git checkout -b [project-name]`
- All subsequent work for this novel happens on this branch.
- **Worktree layout:** after creating the branch, also give the novel its own folder: `git worktree add ../[project-name] [project-name]` (run from the repo root).

### 4. Project Structure Creation
Create in a relative folder `[project-name]/` (never absolute paths):

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

Note: `history.md` is NOT created in Phase 1 (optional Phase 3 element). `notes.md` is added as it's essential world building.

### 5. Mode, Language, and Author Selection

Ask the user to choose a writing mode:

```
📝 Choose your writing mode for [project-name]:

A — author (You write, AI assists)
B — co-writer (AI writes, you direct)
C — synthfic (AI writes autonomously in batches)

💡 You can switch anytime with /write-novel-mode
```

Write the choice (just `author`, `co-writer`, or `synthfic`) to `metadata/writing_mode.md`.

Ask the user for the language and region (e.g. "English (US)", "Spanish (Spain)"). Write to `metadata/language.md`.

**CRITICAL**: Once language is locked in `metadata/language.md`, all drafted prose MUST be in that language. Filenames and folder structure MUST remain in English.

Ask the user for the author's name. Write to `metadata/author.md`.

### 6. .gitignore Template
Create `.gitignore` inside `[project-name]/`:
```
# Novel project meta files
.ai/.current_project
*.tmp
*.bak
.DS_Store
```

### 7. Git Commit
- `git add [project-name]/`
- `git commit -m "Initial commit: Project structure for '[project-name]'"`
- All paths relative to the repo root. Never absolute.

### 8. Auto-Select Option
Ask: "Set '[name]' as current project? (y/n)". If yes, run `/write-novel-use [name]`.

### 9. Output
- "✅ Project '[name]' created successfully!"
- Show relative project path and active branch
- Next step: "Run `/write-novel-foundations` to begin developing your novel's foundations."

## Error Handling
- Wrong directory: "Error: Must run from the repository root (where .git/ is located)."
- Invalid name: "Error: '[name]' is not a valid project name. Use alphanumeric characters, hyphens, or underscores."
- Reserved name: "Error: '[name]' is a reserved system name. Choose a different name."
- Duplicate folder: "Error: Project '[name]' already exists. Choose a different name or use /write-novel-rename."
- Duplicate branch: "Error: Branch '[name]' already exists. Use `/write-novel-use` to continue or pick a different name."
- Git branch creation failed: "⚠️ Warning: Git branch creation failed. Project not created."
- Git commit failed: "⚠️ Warning: Initial commit failed. Files are staged but not committed."

Requires `git` and write access to the working directory.
