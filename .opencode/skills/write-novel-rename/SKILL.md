# Write Novel - Rename Project

## Purpose
Rename an existing novel project (especially useful for renaming auto-generated "untitledN" projects).

## Behavior

### 1. Directory Validation
- Working directory must be: `/home/dubyte/Documents/Workspace/words/`
- If not in correct directory: Error with message

### 2. Project Selection
1. **If source name provided**: Use that project
2. **If no source name**: Check for stored current project in `.opencode/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Arguments
- **Source name** (optional): Current project name
  - If not provided: Show list of existing projects
- **New name** (required): The new name for the project
  - Must not already exist
  - Cannot be empty

### 4. Validation
- Check if source project exists:
  - If not exists: Error "Project '[source]' does not exist."
- Check if new name already exists:
  - If exists: Error "Project '[new-name]' already exists. Choose a different name."
- Validate new name is not empty

### 5. Rename Operation
- Rename the directory from `[source]` to `[new-name]`
- Update any internal references (if applicable)
- Update README.md title if it contains the old name

### 6. Git Operation
- Stage the rename: `git add -A`
- Commit with message: "Rename project from '[source]' to '[new-name]'"

### 7. Output
- Success message: "✅ Project renamed from '[source]' to '[new-name]'"
- Project path: "Location: /home/dubyte/Documents/Workspace/words/[new-name]/"

## Usage Examples

```bash
# Rename specific project
skill(name="write-novel-rename", user_message="untitled1 MyFantasyNovel")

# Interactive mode (shows list of projects)
skill(name="write-novel-rename", user_message="MyNewName")

# Fully interactive (shows list, then asks for new name)
skill(name="write-novel-rename")
```

## Error Handling
- Wrong directory: "Error: Must run from /home/dubyte/Documents/Workspace/words/"
- Source not found: "Error: Project '[source]' does not exist."
- Target exists: "Error: Project '[new-name]' already exists. Choose a different name."
- Empty new name: "Error: New project name cannot be empty."

## Notes
- Renaming is a Git-aware operation (preserves history)
- Safe operation - will not overwrite existing projects
- Can rename any project, not just "untitledN" projects
