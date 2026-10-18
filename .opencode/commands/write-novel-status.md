---
description: Check the status of all novel projects or a specific project, showing current phase and next steps.
---
Check the status of all novel projects or a specific project, showing current phase and next steps.

Project name: $ARGUMENTS (optional).

## Steps

### 1. Resolve the Active Project (clone- or worktree-agnostic)
- Run `.ai/scripts/novel-env.sh` (pass the project name if provided). It prints `NOVEL`, `NOVEL_DIR`, `REPO_ROOT`, resolving correctly in both a normal clone and a bare-repo + worktrees checkout.
- If it fails to resolve a project (no arg, not on a novel branch, no stored selection), show an overview of all projects instead.

### 2. Project Selection
1. If a project name was provided: show detailed status for that project (`$NOVEL`).
2. Otherwise use the resolved `$NOVEL` from step 1; if none was resolved, show an overview of all projects.

**Phase Detection:** check file existence and read `.ai/[phase]_progress_[project].md` if available:
- **Phase 1 (Setup)**: Project directory exists.
- **Phase 2 (Foundations)**: Check `/metadata/genre.md`.
- **Phase 3 (World Building)**: Check `/world/overview.md` and `.ai/world_progress_[project].md`. Report: "Essentials [X/4] | Optional [Y/8]".
- **Phase 4 (Characters)**: Check `/characters/protagonist.md` and `.ai/character_progress_[project].md`. Report: "Essentials [X/3] | Optional [Y/8]".
- **Phase 5 (Plot)**: Check `/plot/chapter_outlines/` and `.ai/plot_progress_[project].md`.
- **Phase 6 (Drafting)**: Check `/chapters/` and `.ai/drafting_progress_[project].md`.

### 3. Display

**Specific project:**
```
📚 Project: [project-name]
📍 Current Phase: Phase X - [Phase Name]

✅ ESSENTIALS:
   [List of completed essentials for current phase]

📚 OPTIONAL DEPTH:
   [X] of [Y] deep-dives completed
   Next recommended: [Item]

⏳ Next Phase: [Phase Y]
📝 Run: /write-novel-[next-phase] [project-name]
```

**All projects overview:**
```
📚 Novel Projects Status

1. MyFantasyNovel      → Phase 3: World Building
2. untitled1           → Phase 1: Setup Complete

💡 Next steps:
   - MyFantasyNovel: Run `/write-novel-world MyFantasyNovel`
   - untitled1: Run `/write-novel-foundations untitled1`
```

**Empty state:**
```
📚 Novel Projects Status

No projects found.

💡 Get started:
   Run `/write-novel-init` to create your first novel project.
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- Project not found: "Error: Project '[name]' does not exist."

Read-only operation — does not modify any files.
