---
description: Deselect the currently active novel project, returning to explicit project selection mode.
---
Stop using the currently selected project, returning to explicit project selection mode.

## Steps

### 1. Directory Validation
- Working directory must be the repo root (where `.git/` lives). Otherwise: "Error: Must run from the repository root".

### 2. Check Current State
- Check if `./.ai/.current_project` exists.
- If it exists: read and display the project name before clearing.
- If not: inform the user no project was selected.

### 3. Clear Operation
- Delete the `.current_project` file.
- Remove the stored selection.

### 4. Output
**If a project was being used:**
```
🗑️  Stopped using project: [project-name]

✅ All commands will now prompt for project selection.

💡 To select a project again:
   /write-novel-use ProjectName
```

**If no project was selected:**
```
ℹ️  No project was currently selected.

Commands already require explicit project selection.
```

Safe to run even if nothing is stored. After unusing, all commands show the project list again.
