---
name: write-novel-foundations
description: Establish high-level novel framework: genre, target audience, themes, and premise. Use at the start of a new novel.
---
# Write Novel - Phase 2: Foundational Concepts

## Purpose
Establish the high-level framework of the novel: genre, target audience, themes, and premise.

## Writing Mode Note
This phase works identically in both `author` and `co-writer` modes — the AI interviews and you answer. Mode only affects the drafting phase.

## Behavior

### 1. Resolve the Active Project (clone- or worktree-agnostic)
- Run `.ai/scripts/novel-env.sh` (pass the project name if the user provided one, e.g. `.ai/scripts/novel-env.sh MyFantasyNovel`).
- It prints `NOVEL` (project name), `NOVEL_DIR` (the project's folder), and `REPO_ROOT` (repo root where `.ai/` and `.opencode/` live). This resolves correctly whether the repo is a **normal clone** or a **bare-repo + worktrees** checkout.

### 2. Project Selection
- The active project is `$NOVEL` from step 1 (novel-env.sh exits with an error if it can't be resolved).
- Work on files under `$NOVEL_DIR`: paths like `/metadata/…` mean `$NOVEL_DIR/metadata/…`; repo-level `.ai/…` tracking files mean `$REPO_ROOT/.ai/…`.

### 3. Project Validation
- Check if project directory exists
- If not exists: Error "Project '[name]' does not exist. Run /write-novel-init first."

### 4. Phase Detection
- Check if `/metadata/genre.md` is NOT empty
- If already has content: Show current content and ask if user wants to:
  1. Continue working (add more)
  2. Overwrite (start fresh)
  3. Cancel

### 5. Phase 2 Content Collection
Guide user through interactive prompts to collect:

**A. Genre** → Save to `/metadata/genre.md`
- Primary genre (e.g., Fantasy, Sci-Fi, Mystery, Romance)
- Sub-genre or genre blend (optional)

**B. Target Audience** → Save to `/metadata/target_audience.md`
- Age range (e.g., Young Adult, Adult, Middle Grade)
- Reader expectations
- Comparable books/authors (comps)

**C. Themes** → Save to `/metadata/themes.md`
- Central themes (2-3 main ones)
- Sub-themes or motifs

**D. Logline/Premise** → Save to `/plot/high_level_summary.md`
- One-sentence summary of the novel
- Format: "When [inciting incident], a [protagonist descriptor] must [main goal] or [stakes]."

### 6. File Structure
Each file should follow this format:
```markdown
# Genre

**Primary Genre**: [Genre]
**Sub-genre**: [Sub-genre]
**Tone**: [e.g., Dark, Light-hearted, Gritty, Whimsical]

## Notes
[Any additional notes about genre expectations or conventions]
```

### 7. Git Operations
After each file is created/updated:
- `git add [file]`
- `git commit -m "Phase 2: Add [genre|target audience|themes|logline] for [project-name]"`

### 8. README.md Update
Update the project's README.md:
- Mark Phase 2 as complete ✅
- Update Current Phase to "Phase 3: World Building"
- Update Next Step to "write-novel-world [project-name]"
- Add any TODOs based on user input

### 9. Output
```
✅ Phase 2 Complete: Foundational Concepts

📁 Files created/updated:
   - metadata/genre.md
   - metadata/target_audience.md
   - metadata/themes.md
   - plot/high_level_summary.md

📍 Current Phase: Phase 3 - World Building
⏭️  Next: Run `write-novel-world [project-name]`
```

## Usage Examples

```bash
# Work on specific project
skill(name="write-novel-foundations", user_message="MyFantasyNovel")

# Interactive mode (shows project list)
skill(name="write-novel-foundations")
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- No projects: "No projects found. Run /write-novel-init to create one."
- Project not found: "Error: Project '[name]' does not exist."
- Phase already complete: Offer to continue, overwrite, or cancel

## Notes
- Interactive guidance - prompts user for each piece of information
- Validates user input (ensures required fields are filled)
- All content is AI-digestible Markdown with clear structure
- Each major piece gets its own commit for granular history
