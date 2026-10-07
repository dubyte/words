---
description: Select a novel project to work on so you don't have to specify it in every subsequent command.
---
Select a novel project to work on so you don't have to specify it in every subsequent command.

Project name: $ARGUMENTS (optional).

## Steps

### 1. Directory Validation
- Run `git rev-parse --show-toplevel` to confirm you're inside a working tree — works in both a normal clone and a bare-repo + worktrees checkout. Otherwise: "Error: Must run inside the repository".

### 2. Project Selection
- If a name was provided: use it.
- If no name provided:
  - If `.ai/.current_project` exists and the user only wants to check current, show it (step 8).
  - Otherwise list all project folders (worktree folders and repo-root subfolders) as a numbered list and prompt the user to choose.

### 3. Validation
- Check the git branch `[name]` exists (`git show-ref --verify refs/heads/[name]`).
- If missing: "Error: Project '[name]' does not exist."

### 4. Activate (checkout OR worktree) & cd
- Resolve the project directory with `.ai/scripts/novel-env.sh [name]` — it prints `NOVEL_DIR` and `NOVEL_WORKTREE`.
  - If `NOVEL_WORKTREE` is set (worktree layout): just `cd "$NOVEL_DIR"` — that branch is already checked out there.
  - Else (normal clone): `git checkout [name]` then `cd "$NOVEL_DIR"`.
- All subsequent file operations happen inside this folder, on this branch.

### 5. Mode Check & Prompt
- Read `metadata/writing_mode.md` (default to `author` if missing).
- Display current mode and ask: "Keep this mode? (yes / author / co-writer)".
- If the user chooses a different mode, write it to `metadata/writing_mode.md` and commit.

### 6. Storage
- Store project name in `.ai/.current_project` (relative to repo root). Simple text file with just the project name.

### 7. Output
```
✅ Now using project: [project-name]

📁 Location: ./[project-name]/
🌿 Branch: [project-name]
📝 Mode: [author / co-writer]

💡 Next commands will use this project automatically:
   /write-novel-foundations  # Works on [project-name]
   /write-novel-world        # Works on [project-name]

📋 To check current project: /write-novel-use
🗑️  To stop using: /write-novel-unuse
🔄 To switch mode: /write-novel-mode
```

### 8. Show Current (if run without args and `.current_project` exists)
```
📌 Currently using project: [project-name]

📁 Location: ./[project-name]/
🌿 Branch: [project-name]
📝 Mode: [author / co-writer]

To switch:      /write-novel-use other-project
To stop:        /write-novel-unuse
To switch mode: /write-novel-mode
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- Project not found: "Error: Project '[name]' does not exist."
- No projects: "No projects found. Create one with /write-novel-init first."

Stored in `.ai/.current_project`, persistent across sessions.
