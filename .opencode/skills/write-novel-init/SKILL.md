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

### 3. Directory Validation
- Working directory must be: `[workspace]/`
- If not in correct directory: Error with message
- Check if project name already exists:
  - If exists: Error "Project '[name]' already exists. Choose a different name or use write-novel-rename."
  - If not exists: Proceed

### 4. Project Structure Creation
Create the following structure in `[workspace]/[project-name]/`:

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

### 7. Git Initialization
- Check if `[workspace]/.git` exists.
  - If it exists: Just run `git add [project-name]` from workspace root.
  - If not exists: Run `git init` in project directory, then `git add .` and initial commit.
- Initial commit: "Initial commit: Project structure for '[project-name]'"

**Created**: [Date]
**Current Phase**: Phase 1: Project Setup Complete
**Next Step**: Run `write-novel-foundations` to begin Phase 2

## TODO

- [ ] Phase 2: Foundational Concepts (genre, themes, logline)
- [ ] Phase 3: World Building
- [ ] Phase 4: Character Development
- [ ] Phase 5: Plot & Structure
- [ ] Phase 6: Drafting

## Progress Log

- [Date]: Project initialized
```

### 6. .gitignore Template
Create .gitignore with:

```
# Novel project meta files
.opencode/.current_project
*.tmp
*.bak
.DS_Store
```

### 7. Git Initialization
- Run `git init` in project directory
- Stage all files: `git add .`
- Create initial commit: "Initial commit: Project structure created"

### 8. Auto-Select Option
After successful creation, ask user:
```
✅ Project '[name]' created successfully!

📁 Location: [workspace]/[project-name]/

❓ Set '[name]' as current project? (y/n)
```

If yes: Automatically run equivalent of `write-novel-use [name]`

### 9. Output
- Success message: "✅ Project '[name]' created successfully!"
- Display project path
- Next step: "Run `write-novel-foundations` to begin developing your novel's foundations."
- If auto-selected: "This project is now set as current. You can run skills without specifying the project name."

## Usage Examples

```bash
# With specific name
skill(name="write-novel-init", user_message="MyFantasyNovel")

# Auto-generate untitled name
skill(name="write-novel-init")
# Result: Creates "untitled3" (if untitled1 and untitled2 exist)
```

## Error Handling
- Wrong directory: "Error: Must run from [workspace]/"
- Invalid project name: "Error: '[name]' is not a valid project name. Use alphanumeric characters, hyphens, or underscores."
- Reserved name: "Error: '[name]' is a reserved system name. Choose a different name."
- Duplicate name: "Error: Project '[name]' already exists. Choose a different name or use write-novel-rename."
- Git init failed: "⚠️  Warning: Git initialization failed. Project created but not version controlled."
- Git commit failed: "⚠️  Warning: Initial commit failed. Files are staged but not committed."

## Dependencies
- Requires `git` to be installed
- Requires write access to working directory
