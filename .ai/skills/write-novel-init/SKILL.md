# Write Novel - Initialize Project

## Purpose
Initialize a new novel project with complete directory structure and Git repository.

## Behavior

### 1. Project Name Resolution
- If user provides a name: Use it (e.g., "MyFantasyNovel")
- If no name provided: Auto-generate "untitledN" where N is the next available number
  - Check existing directories for "untitled1", "untitled2", etc.
  - Use the next available number
  - Example: If untitled1 and untitled2 exist, create untitled3

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
│   └── themes.md          # (empty initially)
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
│   └── chapter_outlines/  # (directory)
├── chapters/              # (directory for drafts)
└── appendix/
    └── inspiration.md     # (empty initially)
```

**Note**: `history.md` is NOT created in Phase 1 as it's an optional Phase 3 element. `notes.md` is added as it's an essential world building element.

...

### 6. .gitignore Template
Create `.gitignore` inside `[project-name]/` with:

```
# Novel project meta files
.ai/.current_project
*.tmp
*.bak
.DS_Store
```

### 7. Git Commit
- Stage the new folder: `git add [project-name]/`
- Commit from the repo root: `git commit -m "Initial commit: Project structure for '[project-name]'"`
- **All paths in commands must be relative to the repo root. Never use absolute paths.**

### 8. Auto-Select Option
After successful creation, ask user:
```
✅ Project '[name]' created successfully!

📁 Location: ./[project-name]/
🌿 Branch: [project-name]

❓ Set '[name]' as current project? (y/n)
```

If yes: Automatically run equivalent of `write-novel-use [name]`

### 9. Output
- Success message: "✅ Project '[name]' created successfully!"
- Display relative project path and active branch
- Next step: "Run `write-novel-foundations` to begin developing your novel's foundations."
- If auto-selected: "This project is now set as current. You can run skills without specifying the project name."

## Usage Examples

```bash
# With specific kebab-case name
skill(name="write-novel-init", user_message="my-fantasy-novel")
# Creates branch my-fantasy-novel, folder ./my-fantasy-novel/

# Auto-generate untitled name (also kebab-case)
skill(name="write-novel-init")
# Result: Creates branch "untitled-3", folder ./untitled-3/ (if untitled-1/2 exist)
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
