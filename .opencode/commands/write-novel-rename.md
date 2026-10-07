---
description: Rename an existing novel project, including its folder, branch, and all references.
---
Rename an existing novel project, including its folder, branch, and all references.

Arguments: source name = $1 (optional), new name = $2 (required).

## Steps

### 1. Directory Validation
- Run `.ai/scripts/novel-env.sh` (pass the source name as `$1` if provided) to resolve `REPO_ROOT` and the source project — works in both a normal clone and a bare-repo + worktrees checkout.

### 2. Project Selection
1. If source name provided (`$1`): use that project.
2. If no source name: use the resolved `$NOVEL` from step 1; if none resolved, list all projects as a numbered list and prompt for selection.
3. New name (`$2`) is required. If missing, prompt the user.

### 3. Validation
- If source project doesn't exist: "Error: Project '[source]' does not exist."
- If new name already exists: "Error: Project '[new-name]' already exists. Choose a different name."
- New name cannot be empty.

### 4. Rename Operation
- Rename the directory from `[source]` to `[new-name]`.
- Update any internal references (if applicable).
- Update README.md title if it contains the old name.
- If `./.ai/.current_project` contains `[source]`, update it to `[new-name]`.

### 5. Git Operation
- `git add -A`
- `git commit -m "Rename project from '[source]' to '[new-name]'"`

### 6. Output
- "✅ Project renamed from '[source]' to '[new-name]'"
- "Location: ./[new-name]/"

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- Source not found: "Error: Project '[source]' does not exist."
- Target exists: "Error: Project '[new-name]' already exists. Choose a different name."
- Empty new name: "Error: New project name cannot be empty."

Git-aware operation — preserves history, will not overwrite existing projects.
