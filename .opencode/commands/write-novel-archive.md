---
description: Move completed or abandoned novel projects to an archive folder outside the active workspace.
---
Safely move a completed or abandoned project out of the active workspace and into an archives folder.

Project name: $ARGUMENTS (optional).

## Steps

### 1. Directory Validation
- Run `.ai/scripts/novel-env.sh` (pass the project name if provided) to resolve `REPO_ROOT` and the active project — works in both a normal clone and a bare-repo + worktrees checkout.

### 2. Project Selection
1. If project name provided: use that project.
2. If no name: use the resolved `$NOVEL` from step 1; if none resolved, list all projects as a numbered list and prompt for selection.

### 3. Archive Operation
- Create `./archives/` directory if it doesn't exist.
- Move the selected project directory to `./archives/[project-name]/`.
- If the archived project was the currently selected project in `$CURRENT_PROJECT_FILE` (or legacy `$REPO_ROOT/.ai/.current_project`), delete those files.

### 4. Git Operation
- `git add -A`
- `git commit -m "Archive project: '[project-name]'"`

### 5. Output
- "✅ Project '[project-name]' moved to archives."
- "📁 New location: ./archives/[project-name]/"
- Tip: "To restore, simply move the directory back to the workspace root."

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- Project not found: "Error: Project '[project-name]' does not exist."
- Already archived: "Error: Project is already in archives."
