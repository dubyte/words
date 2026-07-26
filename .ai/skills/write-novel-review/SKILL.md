---
name: write-novel-review
description: Audits and reviews large batches of novel chapters using subagents to prevent context overflow.
---
# Write Novel - Review & Audit

## Purpose
Analyze, review, and audit large sections of the novel (or the entire project) for consistency, pacing, character arcs, and prose quality without overflowing the AI's context window.

## Philosophy
**Divide and Conquer**: A full novel cannot be held in active memory. To review effectively, rely on the meta-documents as the source of truth, and use subagents to review specific batches of raw text in parallel.

## Behavior

### 1. Directory & Project Validation
- Check `.ai/.current_project` to identify the active novel.
- Ensure `plot/continuity_tracker.md` and `metadata/style_guide.md` exist.

### 2. Review Modes

#### Mode A: Global Consistency Check (Meta-Review)
- **Do NOT read the `draft.md` files.**
- Read `plot/continuity_tracker.md`, `plot/high_level_summary.md`, and any files in `characters/`.
- Analyze the overall pacing, plot holes, character arcs, and structural integrity based entirely on the tracker summaries.
- Produce an artifact: `review_global_structure.md`.

#### Mode B: Deep Prose & Arc Review (Chapter Batches)
Cuando el usuario pida revisar capítulos específicos o la novela entera a nivel de prosa:
1. **Nunca leas docenas de borradores tú mismo.**
2. Utiliza la herramienta `invoke_subagent` para crear múltiples subagentes (por ejemplo, 4 subagentes, cada uno revisando 5 capítulos).
3. **Prompt del Subagente**: Dale a cada subagente:
   - Las reglas de estilo de `metadata/style_guide.md`.
   - El resumen de sus capítulos asignados extraído de `continuity_tracker.md`.
   - Instrucciones para que lean los archivos `draft.md` específicos.
   - Preguntas específicas a responder (ej. "¿El diálogo es realista? ¿El ritmo decae?").
4. Espera a que los subagentes reporten sus hallazgos mediante `send_message`.
5. Sintetiza todos los reportes en un único artefacto (ej. `review_prose_report.md`).

### 3. Áreas de Enfoque (Review Focus)
Pregunta al usuario en qué quiere enfocarse:
- **Trama y Continuidad**: ¿Tienen sentido los eventos? ¿Hay hilos sueltos?
- **Consistencia de Personajes**: ¿Los personajes suenan como ellos mismos según sus perfiles?
- **Ritmo y Tono**: ¿La historia se arrastra? ¿Se alinea con la guía de estilo?
- **Mostrar, No Contar**: ¿Hay demasiados párrafos de resumen que deberían ser escenas de acción/diálogo?

### 4. Output
Genera siempre los hallazgos en un documento Markdown o artefacto estructurado que contenga:
- **Fortalezas**: Qué está funcionando bien.
- **Debilidades**: Áreas de preocupación o fallos de continuidad.
- **Recomendaciones Accionables**: Cambios específicos que deben hacerse durante la fase de revisión. Cada hallazgo debe incluir severidad (🔴🟠🟡🟢), capítulos afectados, y sugerencia de fix precedida por `→ **Fix:**` para que `write-novel-revise` pueda consumirlos automáticamente en su pipeline de corrección post-review (sección 4 de su SKILL.md).
