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
  2. `git checkout main`
  3. Apply `.ai/` changes and commit
  4. `git checkout <novel-branch>` and `git merge origin/main`
- **Resuming a novel:** `git checkout <kebab-name>` then work inside `<kebab-name>/` (relative paths)
- **All paths must be relative to repo root.** Never use `/home/...` or `[workspace]/` literals

## Novel State & Memory

- Use `save_memory (scope="project")` with prefix `novel_architect_` for novel-specific state
  - Example: `novel_architect_method_tiempo: Snowflake`
- Active project tracked in `.ai/.current_project` (plaintext, one line with the novel name)

## Key Files (agent should know)

- `.ai/skills/` — all OpenCode skill definitions (SKILL.md + resources per skill)
- `.opencode/commands/` — all slash commands (tracked in git; `.opencode/*` otherwise ignored)
- `.ai/.current_project` — which novel is currently selected
- `.gitignore` — excludes `.opencode/*` (except commands), `.omo/`, compiled e-books (`**/exports/*.epub` etc.)

## Prerequisites

- `pandoc` required for EPUB generation (`/write-novel-compile`)
- `calibre` (provides `ebook-convert`) optional for MOBI/AZW3/PDF conversion
