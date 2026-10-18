---
description: Deselect the currently active novel project, returning to explicit project selection mode.
---
Stop using the currently selected project, returning to explicit project selection mode.

## Steps

### 1. Directory Validation
- Run `REPO_ROOT="$(git rev-parse --show-toplevel)"` to confirm you're inside a working tree — works in both a normal clone and a bare-repo + worktrees checkout.
- Resolve the shared selection file path (does not require an active novel):
  `CURRENT_PROJECT_FILE="$(git rev-parse --path-format=absolute --git-common-dir)/novel_current_project"`

### 2. Check Current State
- Check if `$CURRENT_PROJECT_FILE` (or legacy `$REPO_ROOT/.ai/.current_project`) exists and is non-empty.
- If it exists: read and display the project name before clearing.
- If not: inform the user no project was selected.

### 3. Clear Operation
- Delete `$CURRENT_PROJECT_FILE` (and legacy `$REPO_ROOT/.ai/.current_project` if present).
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
