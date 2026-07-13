# Project Agents & Skills

This document outlines the specialized agents (skills) available in this workspace and how they collaborate to write a novel.

## The Novel Writing System

The workspace uses a tiered architecture where a high-level "Architect" orchestrates a suite of specialized "Task Agents."

### 1. The Strategic Layer: Novel Architect
**Skill:** `novel-architect`
- **Role:** The Creative Director and Structural Guide.
- **Responsibility:** 
  - Selecting and maintaining the writing framework (Snowflake, Beat Sheets, Hero's Journey).
  - Ensuring high-level consistency in theme and pacing.
  - Making top-level decisions about the novel's direction.
  - Managing "Novel-Specific Memory" to switch between projects seamlessly.
- **When to invoke:** When starting a new book, deciding on a major plot pivot, or auditing the overall structure of a draft.

### 2. The Implementation Layer: Write-Novel Suite
**Skills:** `write-novel-*` (e.g., `init`, `foundations`, `world`, `characters`, `plot`, `draft`)
- **Role:** Task-Specific Specialists.
- **Responsibility:**
  - **`write-novel-init`**: Sets up the project directory and basic configuration.
  - **`write-novel-foundations`**: Defines the core premise and logline.
  - **`write-novel-world`**: Builds the setting, lore, and geography.
  - **`write-novel-characters`**: Conducts deep character forging (Protagonist, Antagonist, Supporting Cast).
  - **`write-novel-plot`**: Handles scene-by-scene outlining.
  - **`write-novel-draft`**: Manages the actual prose writing and versioning of chapters.
- **When to invoke:** For specific, phased development of the novel's components.

## Collaborative Workflow

1.  **Selection:** The user chooses a writing method via **Novel Architect**.
2.  **Setup:** **Novel Architect** calls `write-novel-init` to prepare the workspace.
3.  **Discovery:** **Novel Architect** uses the chosen method (e.g., Snowflake) to guide the user through the phases of `write-novel-foundations`, `world`, and `characters`.
4.  **Execution:** When drafting, **Novel Architect** provides the "Beat" or "Step" context, while `write-novel-draft` handles the file operations and prose.

## Memory & Context
**Skill Location:** All skills live in `.ai/skills/` and are referenced from there by the agent system.

## Git & Folder Workflow (CRITICAL)

Every novel is isolated in its own **Git branch** and matching **folder**.

### Rules
1. **Branch name == Folder name == kebab-case novel name**  
   Example: novel *"The Moonlight Thief"* → branch `the-moonlight-thief` + folder `the-moonlight-thief/`.
2. **Initialization (`write-novel-init`)**  
   - Create the branch: `git checkout -b <kebab-name>`  
   - Create the folder inside the repo root (relative path, never absolute).  
   - All subsequent file operations happen inside that folder, on that branch.
3. **Resuming / Continuing a novel**  
   - When the user says *"continue with <name>"*, first run:  
     `git checkout <kebab-name>` then `cd <kebab-name>/` (relative).  
   - Never continue work on `main`.
4. **No hardcoded absolute paths**  
   - All paths must be relative to the repository root.  
   - Never use `/home/...` or `[workspace]/` literals in file operations.

Novel-specific state is persisted using `save_memory (scope="project")` with the prefix `novel_architect_`.
