---
description: Switch a novel between author mode and co-writer mode. Use when changing how the AI collaborates on the novel.
---
Switch a novel between `author`, `co-writer`, and `synthfic` modes.

Mode: $ARGUMENTS (optional — one of `author`, `co-writer`, `synthfic`). If provided, set it directly; otherwise prompt.

## Steps

### 1. Validate Project
- A project must be selected (explicit name or `.ai/.current_project`).
- Otherwise: "Error: No project selected. Run /write-novel-use first."

### 2. Read Current Mode
- Read `metadata/writing_mode.md` in the current project. Default to `author` if missing.

### 3. Show Current & Ask (if no mode argument given)
```
📖 [Project Name] — Current Mode: [author/co-writer/synthfic]

Mode A — author (You write, AI assists)
Mode B — co-writer (AI writes, you direct)
Mode C — synthfic (AI writes autonomously in batches)

Switch mode? (keep / author / co-writer / synthfic)
```

### 4. Write Mode File
- Write the selected mode to `metadata/writing_mode.md`.
- `git commit -m "Switch writing mode to [mode]"`.

### 5. Output
```
✅ Writing mode set to: [mode]

📖 Next time you draft:
  [author] → You'll write. I'll support.
  [co-writer] → I'll draft. You'll direct.
  [synthfic] → I'll draft autonomously based on your outlines.

💡 Switch anytime with /write-novel-mode
```

## Notes
- Mode only affects the **drafting** phase.
- Planning phases (foundations, world, characters, plot) are the same in both modes.
- Switching mid-chapter is allowed — previous prose remains; future prose follows the new mode.
