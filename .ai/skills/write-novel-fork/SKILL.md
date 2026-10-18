---
name: write-novel-fork
description: Uses Git branching to create alternative narrative timelines and "What if?" scenarios without breaking the main story.
---
# Write Novel - Narrative Branching (Fork)

## Purpose
Utilize standard version control (Git) to explore alternate narrative paths, different character decisions, or experimental prose without affecting the canonical timeline of the novel.

## Philosophy
**Multiverse as Branches**: In software, we branch to test features. In fiction, we branch to test destinies.

## Behavior

### 1. Identify the Divergence Point
- The user triggers this skill when they are unsure of a narrative choice (e.g., "Should the protagonist kill the villain or spare them?").
- Ensure all current work on the active branch is committed cleanly.

### 2. Create Narrative Branches
Execute Git commands to create divergent timelines:
1. Identify the current canonical branch (e.g., `my-fantasy-novel`).
2. Create Branch A: `git checkout -b alternate-ending-spare`
3. (Optional) Create Branch B: `git checkout -b alternate-ending-kill`

> **Worktree layout:** if the repo is checked out as a bare repo + worktrees, create
> each alternate timeline as its own worktree folder instead of `git checkout -b`:
> `git worktree add -b alternate-ending-spare ../alternate-ending-spare`
> (then the same for branch B). The merge steps below are unchanged.

> **Folder vs. branch exception:** Narrative fork branches are the **one sanctioned
> exception** to the "branch name == folder name" rule. Alternate branches keep the
> **original novel folder name** (e.g. `my-fantasy-novel/` inside the fork branch or
> worktree). Because the branch name does not match a project directory, `.ai/scripts/novel-env.sh`
> will not infer the project from the branch name — pass the novel name explicitly
> (`.ai/scripts/novel-env.sh my-fantasy-novel`) or rely on the stored selection from
> `/write-novel-use` (`$CURRENT_PROJECT_FILE`).

### 3. Write in the Alternate Timeline
- Switch to one of the new branches (and work inside the original `<novel>/` directory).
- Update `plot/high_level_summary.md` and the relevant `chapter_outlines/` on this new branch to reflect the divergent choice.
- Use `write-novel-draft` to write the chapters in this alternate timeline.
- Commit the changes on this branch.

### 4. Compare and Merge
- The user can switch between branches (`git checkout [branch-name]` in a normal clone, or `cd` into the branch's worktree folder in a worktree layout) to read the different versions of the compiled EPUB or drafts.
- Once the user decides which timeline is canonical:
  1. `git checkout [canonical-branch]` (normal clone), or `cd` into the canonical branch's worktree (worktree layout)
  2. `git merge [chosen-alternate-branch]`
  3. Delete the discarded branch if desired (`git branch -d [discarded-branch]`), or keep it as an alternate timeline for future reference.

### 5. Output
Inform the user when a fork is created:
```
🔀 NARRATIVE FORK CREATED

You are now in the alternate timeline: [branch-name]
Changes made here will NOT affect your main story until you decide to merge them.

💡 What to do next:
1. Update your outlines for this timeline.
2. Use 'write-novel-draft' to see how this path plays out.
3. If you hate it, simply switch back to your main branch!
```
