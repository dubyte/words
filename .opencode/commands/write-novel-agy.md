---
description: Delegate a novel-writing phase to Google Antigravity (agy), which follows this repo's skills.
---
Delegate a novel-writing phase to Google Antigravity (agy), which reads this
repo's skills from `.ai/skills/` and follows them.

Phase: $ARGUMENTS (optional — default: drafting)

### 1. Resolve the project
- Run `.ai/scripts/novel-env.sh` (pass the project name if given) to get `NOVEL`, `NOVEL_DIR`, and `REPO_ROOT`.

### 2. Delegate to agy
- Use the `collaborating-with-antigravity` skill / `agy-bridge`:
  ```bash
  python ~/.agents/skills/collaborating-with-antigravity/scripts/agy_bridge.py \
    --cd "$REPO_ROOT" \
    --mode review \
    --PROMPT "Follow .ai/skills/write-novel-<phase>/SKILL.md for the novel project '$NOVEL'. Work inside $NOVEL_DIR."
  ```
- Pick the mode:
  - `review` — critique the current state of that phase.
  - `ask` — one-shot question about the novel.
  - `plan` — multi-step plan for the phase.
  - `execute` — apply edits (needs `--allow-write`; runs in an isolated worktree).
- Map the phase to a skill: foundations, world, characters, plot, draft, review, revise, fork.

### 3. Review the result
- Read the bridge's JSON envelope (`success`, `agent_messages`, `error`).
- Surface the diff/summary to the user. Do not auto-merge an `execute` worktree —
  inspect `git worktree list` and merge manually when satisfied.
