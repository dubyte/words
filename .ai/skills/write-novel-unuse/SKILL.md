# Write Novel - Unuse Project

## Purpose
Stop using the currently selected project, returning to explicit project selection mode.

## Behavior

### 1. Directory Validation
- Working directory must be the repo root (where `.git/` lives)

### 2. Check Current State
- Check if `./.ai/.current_project` exists
- If exists: Read and display the project name before clearing
- If not exists: Inform user no project was selected

### 3. Clear Operation
- Delete the `.current_project` file
- Remove the stored selection

### 4. Output

**If a project was being used:**
```
🗑️  Stopped using project: [project-name]

✅ All skills will now prompt for project selection.

💡 To select a project again:
   skill(name="write-novel-use", user_message="ProjectName")
```

**If no project was selected:**
```
ℹ️  No project was currently selected.

Skills already require explicit project selection.
```

## Usage Example

```bash
# Stop using the current project
skill(name="write-novel-unuse")
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root"

## Notes
- Simple operation - just removes the stored project file
- Safe to run even if nothing is stored
- After unusing, all skills will show project list again
