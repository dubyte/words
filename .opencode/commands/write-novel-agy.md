---
description: Delegate a novel-writing phase to Google Antigravity (agy), which follows this repo's skills.
---
Delegate a novel-writing phase to Google Antigravity (agy), which reads this
repo's skills from `.ai/skills/` and follows them.

Arguments: `$ARGUMENTS` — `<phase> [mode]` (optional — default phase: `draft`, default mode: `review`).
Example: `/write-novel-agy draft execute`

### 1. Parse arguments & resolve the project
- Parse `$ARGUMENTS`: first token is `<phase>` (default: `draft`), second token is `<mode>` (default: `review`).
- Run `.ai/scripts/novel-env.sh` (pass the project name if given) to get `NOVEL`, `NOVEL_DIR`, and `REPO_ROOT`.

### 2. Delegate to agy
- Invoke the bridge via `${AGY_BRIDGE:-agy-bridge}` (set `AGY_BRIDGE` to the path of `agy_bridge.py` if it is not on `PATH`):
  ```bash
  ${AGY_BRIDGE:-agy-bridge} \
    --cd "$REPO_ROOT" \
    --mode "${MODE:-review}" \
    --PROMPT "Follow .ai/skills/write-novel-<phase>/SKILL.md for the novel project '$NOVEL'. Work inside $NOVEL_DIR."
  ```
- Modes (`<mode>`):
  - `review` (default) — critique the current state of that phase.
  - `ask` — one-shot question about the novel.
  - `plan` — multi-step plan for the phase.
  - `execute` — apply edits (needs `--allow-write`; runs in an isolated worktree).
- Map `<phase>` to a skill: `foundations`, `world`, `characters`, `plot`, `draft`, `review`, `revise`, `fork`.

### 3. Review the result
- Read the bridge's JSON envelope (`success`, `agent_messages`, `error`).
- Surface the diff/summary to the user. Do not auto-merge an `execute` worktree —
  inspect `git worktree list` and merge manually when satisfied.
