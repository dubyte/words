# Write Novel - Project Status

## Purpose
Check the status of all novel projects or a specific project, showing current phase and next steps.

## Behavior

### 1. Directory Validation
- Working directory must be: `/home/dubyte/Documents/Workspace/words/`
- If not in correct directory: Error with message

### 2. Project Selection
1. **If project name provided**: Show detailed status for that project
2. **If no project name**: Check for stored current project in `.opencode/.current_project`
   - If stored project exists: Show detailed status for stored project
   - If no stored project: Show overview of all projects
For each project, determine current phase by checking file contents:

**Phase Detection:**
- **Phase 1 (Setup)**: Project exists (always complete if project exists)
- **Phase 2 (Foundations)**: `/metadata/genre.md` is NOT empty
- **Phase 3 (World Building)**: `/world/overview.md` is NOT empty
- **Phase 4 (Characters)**: `/characters/protagonist.md` is NOT empty
- **Phase 5 (Plot)**: `/plot/high_level_summary.md` is NOT empty AND `/plot/chapter_outlines/` has files
- **Phase 6 (Drafting)**: `/chapters/` has files with content

### 3. Project Status Display

**If specific project name provided:**
Show detailed status for that single project:
```
📚 Project: [project-name]
📍 Current Phase: Phase X - [Phase Name]
✅ Completed: [list of completed phases]
⏳ Next: [Phase Y - Phase Name]
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
# Check all projects
skill(name="write-novel-status")

# Check specific project
skill(name="write-novel-status", user_message="MyFantasyNovel")
```

## Error Handling
- Wrong directory: "Error: Must run from /home/dubyte/Documents/Workspace/words/"
- Project not found: "Error: Project '[name]' does not exist."

## Output Format
- Clear visual indicators (✅ ⏳ 📍 📝)
- Actionable next steps
- Quick reference commands

## Notes
- Read-only operation (does not modify any files)
- Fast status check for all projects
- Helps user decide which skill to run next
