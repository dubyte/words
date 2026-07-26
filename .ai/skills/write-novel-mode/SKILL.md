# Write Novel - Switch Writing Mode

## Purpose
Switch a novel between `author` mode and `co-writer` mode at any time.

## Behavior

### 1. Read Current Mode
- Read `metadata/writing_mode.md` in the current project
- If file doesn't exist, default to `author`

### 2. Show Current & Ask
```
📖 [Project Name] — Current Mode: [author/co-writer/synthfic]

Mode A — author (You write, AI assists)
  • AI asks questions, tracks continuity, creates context
  • You write every word of draft.md
  • AI is your editor, continuity checker, motivator

Mode B — co-writer (AI writes, you direct)
  • You give high-level direction and constraints
  • AI generates prose, scenes, dialogue
  • You review, edit, and redirect

Mode C — synthfic (AI writes autonomously in batches)
  • You set up the detailed outline and world data
  • AI writes chapter after chapter autonomously based on established data
  • AI maintains a continuity tracker automatically

Switch mode? (keep / author / co-writer / synthfic)
```

### 3. Write Mode File
- Write the selected mode to `metadata/writing_mode.md`
- Commit: "Switch writing mode to [mode]"

### 4. Output
```
✅ Writing mode set to: [mode]

📖 Next time you draft:
  [author] → You'll write. I'll support.
  [co-writer] → I'll draft. You'll direct.
  [synthfic] → I'll draft autonomously based on your outlines.

💡 Switch anytime with skill(name="write-novel-mode")
```

## Usage

```bash
# Switch mode for current project
skill(name="write-novel-mode")

# This is also offered at the start of every session
```

## Error Handling
- No project selected: "Error: No project selected. Run write-novel-use first."
- Project not found: "Error: Project does not exist."

## Notes
- Mode only affects the **drafting** phase
- Planning phases (foundations, world, characters, plot) are the same in both modes
- Switching mid-chapter is allowed — previous AI-generated prose remains; future prose follows the new mode
