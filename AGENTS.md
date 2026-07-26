# Project Agents & Skills

This is a novel-writing skills workspace — no build system, no tests, no linting. Skills live in `.ai/skills/`. Novels live in named folders on their own git branches.

## Git & Folder Workflow (CRITICAL)

- **Branch name == Folder name == kebab-case novel name**
  - Novel "The Moonlight Thief" → branch `the-moonlight-thief` + folder `the-moonlight-thief/`
- **`main` branch holds only the skill definitions and documentation** — never commit novel files to `main`
- **Resuming a novel:** `git checkout <kebab-name>` then work inside `<kebab-name>/` (relative paths)
- **All paths must be relative to repo root.** Never use `/home/...` or `[workspace]/` literals

## Novel State & Memory

- Use `save_memory (scope="project")` with prefix `novel_architect_` for novel-specific state
  - Example: `novel_architect_method_tiempo: Snowflake`
- Active project tracked in `.ai/.current_project` (plaintext, one line with the novel name)

## Key Files (agent should know)

- `.ai/skills/` — all OpenCode skill definitions (SKILL.md + resources per skill)
- `.ai/.current_project` — which novel is currently selected
- `.gitignore` — excludes `.opencode/`, `.omo/`, compiled e-books (`**/exports/*.epub` etc.)

## Prerequisites

- `pandoc` required for EPUB generation (`write-novel-compile`)
- `calibre` (provides `ebook-convert`) optional for MOBI/AZW3/PDF conversion
