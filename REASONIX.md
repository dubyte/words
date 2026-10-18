# REASONIX.md

This repo's skills are shared across AI coding agents (OpenCode, Reasonix, and
Antigravity used as a delegate). This file is read specifically by Reasonix.

## Canonical locations

- **Skills** live in `.ai/skills/` — Reasonix reads them via the
  `.reasonix/skills` symlink.
- **Slash commands** live in `.opencode/commands/` — Reasonix reads them via the
  `.reasonix/commands` symlink.
- **Shared conventions** live in `AGENTS.md` (read by both OpenCode and Reasonix).

Do not create a second copy of a skill under `.reasonix/`; edit the canonical
`.ai/skills/` file instead. (Note: on Windows, ensure `git config core.symlinks true`
is enabled before cloning so `.reasonix/*` are checked out as real symlinks.)

## Working in this repo

- Novels live in folders named after their branch (kebab-case). `main` holds only
  the skills/commands/docs — never novel content.
- Resolve the active novel and repo root with `.ai/scripts/novel-env.sh` — it
  works identically in a normal clone and a bare-repo + worktrees checkout.
- `.ai/` and `.opencode/` changes go to `main`, never on a novel branch.
- Skill bodies avoid agent-specific tool names, so Reasonix, OpenCode, and
  Antigravity can all follow them.
