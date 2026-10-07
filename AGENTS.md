# Project Commands & Skills

This is a novel-writing workspace — no build system, no tests, no linting. Commands live in `.opencode/commands/`, skills in `.ai/skills/`. Novels live in named folders on their own git branches.

## Available Commands (type `/` in the TUI)

| Command | Description |
|---------|-------------|
| `/write-novel-init` | Initialize a new novel project (dirs, git branch, metadata) |
| `/write-novel-use` | Select a novel project to work on |
| `/write-novel-unuse` | Deselect the active novel project |
| `/write-novel-status` | Check project status, current phase, and next steps |
| `/write-novel-rename` | Rename a novel project (folder, branch, references) |
| `/write-novel-archive` | Move a completed or abandoned project to archives |
| `/write-novel-mode` | Switch writing mode (author / co-writer / synthfic) |
| `/write-novel-metadata` | Update book metadata for EPUB compilation |
| `/write-novel-compile` | Compile draft chapters to EPUB |

## Git & Folder Workflow (CRITICAL)

- **Branch name == Folder name == kebab-case novel name**
  - Novel "The Moonlight Thief" → branch `the-moonlight-thief` + folder `the-moonlight-thief/`
- **`main` branch holds only the commands, skill definitions, and documentation** — never commit novel files to `main`
- **`.ai/` and `.opencode/commands/` changes always go to `main`**, never on a novel branch. Workflow:
  1. Stash or commit unrelated changes on the novel branch
  2. Switch to `main` — `git checkout main` (normal clone) or work in the `main` worktree folder (worktree layout)
  3. Apply `.ai/` changes and commit
  4. Return to the novel branch and `git merge origin/main` (clone) or `git merge main` (worktree layout)
- **Resuming a novel:** switch to its branch — `git checkout <kebab-name>` (normal clone) or `cd` into its worktree folder (worktree layout) — then work inside `<kebab-name>/` (relative paths)
- **This repo works in both checkout layouts**: a normal clone and a bare-repo + worktrees setup. Resolve the active novel and repo root with `.ai/scripts/novel-env.sh`; never assume `.git/` is a directory or that `git checkout` is how you switch novels.
- **All paths must be relative to repo root.** Never use `/home/...` or `[workspace]/` literals

## Multi-Agent Portability

- Skills live in `.ai/skills/` and commands in `.opencode/commands/` — these are the **canonical copies**.
- Reasonix reads the same files via the `.reasonix/skills` and `.reasonix/commands` symlinks; shared conventions also live in `REASONIX.md`.
- Antigravity (agy) is a delegate, not a skill host: point it at the repo and have it follow `.ai/skills/<skill>/SKILL.md` (see `/write-novel-agy`).
- Skill bodies avoid agent-specific tool names so OpenCode, Reasonix, and Antigravity can all run them.

## Novel State & Memory

- Use `save_memory (scope="project")` with prefix `novel_architect_` for novel-specific state
  - Example: `novel_architect_method_tiempo: Snowflake`
- Active project is resolved by `.ai/scripts/novel-env.sh` (current branch, then `.ai/.current_project` as a legacy hint)

## Key Files (agent should know)

- `.ai/skills/` — all OpenCode skill definitions (SKILL.md + resources per skill)
- `.opencode/commands/` — all slash commands (tracked in git; `.opencode/*` otherwise ignored)
- `.ai/.current_project` — legacy hint for which novel is selected (see `.ai/scripts/novel-env.sh` for the authoritative resolution)
- `.gitignore` — excludes `.opencode/*` (except commands), `.omo/`, compiled e-books (`**/exports/*.epub` etc.)

## Prerequisites

- `pandoc` required for EPUB generation (`/write-novel-compile`)
- `calibre` (provides `ebook-convert`) optional for MOBI/AZW3/PDF conversion
