---
name: write-novel-rag
description: Dynamically retrieves character and world-building data to inject precise context without overflowing the LLM memory.
---
# Write Novel - Dynamic Lore Retrieval (RAG)

## Purpose
Ensure maximum continuity and accuracy for world-building and character traits by dynamically searching the project's meta-files (`world/`, `characters/`) before writing a scene, retrieving only what is necessary.

## Philosophy
**Just-In-Time Context**: Do not read every character sheet or world document if they don't appear in the chapter. Fetch only what is needed.

## Behavior

### 1. Pre-Draft Analysis
When tasked with writing a chapter or scene:
- Identify the specific Entities (Characters, Locations, Artifacts, Magic Systems) that will be active in this chapter based on `plot/chapter_outlines/chapter_XX_detailed.md`.

### 2. Targeted Retrieval
- Use file search tools (like `grep_search`) to locate mentions of these specific Entities within the `/characters/` and `/world/` directories.
- If the Entity has a dedicated Markdown file (e.g., `characters/kvothe.md`), use `view_file` to read the exact details of that entity.

### 3. Context Assembly
- Extract the relevant facts (e.g., "Kvothe has red hair", "The Eolian smells like smoke and wine") and inject them into the `AGENTS.md` context file for that specific chapter.
- **Do NOT** include lore about entities that are not present in the chapter.

### 4. Integration with `write-novel-draft`
- This skill acts as a pre-processor for `write-novel-draft`.
- Before generating the final prose, the AI must ensure it has successfully performed the RAG retrieval for all key entities to prevent hallucinations.
