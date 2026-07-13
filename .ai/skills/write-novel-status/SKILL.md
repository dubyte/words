# Write Novel - Project Status

## Purpose
Check the status of all novel projects or a specific project, showing current phase and next steps.

## Behavior

### 1. Directory Validation
- Working directory must be the repo root (where `.git/` lives)
- If not in correct directory: Error with message

### 2. Project Selection
1. **If project name provided**: Show detailed status for that project
2. **If no project name**: Check for stored current project in `.ai/.current_project`
   - If stored project exists: Show detailed status for stored project
   - If no stored project: Show overview of all projects
For each project, determine current phase by checking file contents:

**Phase Detection & Deep Status:**
For each project, check file existence and read `.ai/[phase]_progress_[project].md` if available:

- **Phase 1 (Setup)**: Project directory exists.
- **Phase 2 (Foundations)**: Check `/metadata/genre.md`.
- **Phase 3 (World Building)**: Check `/world/overview.md` and `.ai/world_progress_[project].md`.
  - Report: "Essentials [X/4] | Optional [Y/8]"
- **Phase 4 (Characters)**: Check `/characters/protagonist.md` and `.ai/character_progress_[project].md`.
  - Report: "Essentials [X/3] | Optional [Y/8]"
- **Phase 5 (Plot)**: Check `/plot/chapter_outlines/` and `.ai/plot_progress_[project].md`.
- **Phase 6 (Drafting)**: Check `/chapters/` and `.ai/drafting_progress_[project].md`.

### 3. Project Status Display

**If specific project name provided:**
Show detailed status including the progress of optional elements:
```
📚 Project: [project-name]
📍 Current Phase: Phase X - [Phase Name]

✅ ESSENTIALS:
   [List of completed essentials for current phase]

📚 OPTIONAL DEPTH:
   [X] of [Y] deep-dives completed
   Next recommended: [Item]

⏳ Next Phase: [Phase Y]
📝 Run: write-novel-[next-phase] [project-name]
```

**If no project name provided:**
Show overview of all projects:
```
📚 Novel Projects Status

1. MyFantasyNovel      → Phase 3: World Building
2. untitled1           → Phase 1: Setup Complete
3. untitled2           → Phase 5: Plot & Structure

💡 Next steps:
   - MyFantasyNovel: Run `write-novel-world MyFantasyNovel`
   - untitled1: Run `write-novel-foundations untitled1`
   - untitled2: Run `write-novel-draft untitled2`
```

### 4. Empty State
If no projects exist:
```
📚 Novel Projects Status

No projects found.

💡 Get started:
   Run `write-novel-init` to create your first novel project.
```

## Usage Examples

```bash
# Check current/stored project (or all if none stored)
skill(name="write-novel-status")

# Check specific project
skill(name="write-novel-status", user_message="MyFantasyNovel")
```
# Check all projects
skill(name="write-novel-status")

# Check specific project
skill(name="write-novel-status", user_message="MyFantasyNovel")
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- Project not found: "Error: Project '[name]' does not exist."

## Output Format
- Clear visual indicators (✅ ⏳ 📍 📝)
- Actionable next steps
- Quick reference commands

## Notes
- Read-only operation (does not modify any files)
- Fast status check for all projects
- Helps user decide which skill to run next
