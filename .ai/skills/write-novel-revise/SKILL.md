---
name: write-novel-revise
description: Safely updates the plot and orchestrates cascading rewrites to affected chapters based on continuity.
---
# Write Novel - Revision & Cascading Edits

## Purpose
Manage plot changes safely by updating the "brain" of the project (outlines and tracker) before allowing any changes to the "muscle" (chapter drafts).

## Philosophy
**Top-Down Continuity**: Never rewrite a chapter draft without first updating the metadata that governs it. The `continuity_tracker.md` is law.

## Behavior

### 1. Validation
- Identify active project via `.ai/.current_project`.
- Confirm the user's intent: What is the plot change? (e.g., "Character A survives instead of dying in Chapter 15").

### 2. The Revision Pipeline (STRICT ORDER)

#### Step 1: Update the High-Level Plot
- Revisa `plot/high_level_summary.md`.
- Modifica el resumen para reflejar el nuevo cambio usando `replace_file_content`.

#### Step 2: Update the Detailed Outlines
- Identifica qué capítulos se ven directamente afectados por el cambio.
- Modifica `plot/chapter_outlines/chapter_XX_detailed.md` para cada capítulo afectado, reflejando la nueva secuencia de eventos.

#### Step 3: Flag the Continuity Tracker & Database
- Abre `plot/continuity_tracker.md` y `plot/database.json`.
- Para cada capítulo afectado, cambia su estado de `(Redactado)` a `(Requiere reescritura)`.
- Actualiza el texto del resumen en el rastreador y en el JSON para que coincida con la nueva trama.

#### Step 4: Execute the Rewrite
- Itera a través de los capítulos marcados como `(Requiere reescritura)`.
- Lee el nuevo `chapter_XX_detailed.md` actualizado.
- Lee el `draft.md` existente en `chapters/chapter_0XX/`.
- Reescribe el `draft.md` para incorporar la nueva trama, manteniendo el tono especificado en `metadata/style_guide.md`.
- Después de reescribir un capítulo con éxito, actualiza `plot/continuity_tracker.md` para marcarlo nuevamente como `(Redactado)`.

### 3. Safety Protocols
- **No intentes editar múltiples archivos `draft.md` en un solo turno** si la reescritura es masiva. Procésalos uno por uno.
- Si un cambio genera un efecto cascada hacia capítulos que el usuario no anticipó, detente y pregunta: *"Cambiar el Capítulo 15 significa que el Capítulo 20 también necesita una reescritura porque X objeto ya no existe. ¿Debo actualizar el tracker para el Capítulo 20 también?"*

### 4. Git Operations
- Haz *commits* en hitos lógicos: "chore: update plot metadata for [Feature]" y luego "feat: rewrite Chapter [X] based on new plot".
