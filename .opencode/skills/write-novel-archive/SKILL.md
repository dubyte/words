# Write Novel - Archive Project

## Purpose
Safely move a completed or abandoned project out of the active workspace and into an archives folder.

## Behavior

### 1. Directory Validation
- Working directory must be: `[workspace]/`

### 2. Project Selection
1. **If project name provided**: Use that project
2. **If no project name**: Check for stored current project in `.opencode/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Archive Operation
- Create `[workspace]/archives/` directory if it doesn't exist.
- Move the selected project directory to `[workspace]/archives/[project-name]/`.
- **Update Current Project**: If the archived project was the currently selected project in `.opencode/.current_project`, delete that file.

### 4. Git Operation
- Stage the move: `git add -A`
- Commit with message: "Archive project: '[project-name]'"

### 5. Output
- Success message: "✅ Project '[project-name]' moved to archives."
- Location: "📁 New location: [workspace]/archives/[project-name]/"
- Tip: "To restore, simply move the directory back to the workspace root."

## Usage Examples

```bash
# Archive specific project
skill(name="write-novel-archive", user_message="OldNovel")

# Archive current project
skill(name="write-novel-archive")
```

## Error Handling
- Wrong directory: "Error: Must run from [workspace]/"
- Project not found: "Error: Project '[project-name]' does not exist."
- Already archived: "Error: Project is already in archives."

