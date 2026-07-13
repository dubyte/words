# Novel Writing Skills - Quick Start Guide

This directory contains skills for writing novels in the current folder.

## Philosophy: Progressive Depth

**Start Simple, Go Deep As Needed**

These skills are designed to be **flexible**—you can write a complete novel with just the essentials, or explore deep complexity where your story demands it.

**Essentials vs. Optional:**
- ✅ **Essentials** = What you need to write the story (always offered first)
- 📚 **Optional** = What enhances the story (available anytime, never required)

**Why this approach?**
- 🚀 **Fast start**: Begin writing sooner
- 🎯 **No overwhelm**: Not bogged down by 50 world-building questions upfront  
- 🔄 **Iterate**: Add depth where the story actually needs it
- 📝 **Your choice**: Simple story? Essentials only. Epic saga? Go deep.

---

## Git & Folder Workflow

Every novel lives in its own **Git branch** and matching **folder**, both named with **kebab-case**.

- Novel: *"The Moonlight Thief"* → branch `the-moonlight-thief` + folder `the-moonlight-thief/`
- All work for a novel happens **only** on its branch and inside its folder
- Never commit novel files to `main`

### Start a New Novel

```bash
# 1. Create a new novel project
#    This automatically creates the branch and folder
skill(name="write-novel-init", user_message="my-awesome-novel")

# 2. Select it for easy access
skill(name="write-novel-use", user_message="my-awesome-novel")

# 3. Work through the phases (essentials first, go deep if you want)
skill(name="write-novel-foundations")  # Genre, themes, logline
skill(name="write-novel-world")        # World building (essentials → optional deep dives)
skill(name="write-novel-characters")   # Characters (essentials → optional frameworks)
skill(name="write-novel-plot")         # Plot (essentials → optional complexity)
skill(name="write-novel-draft")        # Write chapters (essentials → optional tools)

# 4. Compile to e-book when ready
skill(name="write-novel-compile")      # Generate EPUB to read or share
```

### Continue an Existing Novel

When you say *"continue with my-awesome-novel"*, the agent will:
1. `git checkout my-awesome-novel`
2. `cd my-awesome-novel/`
3. Resume work where you left off

---

## Writing Modes

Every novel has a **writing mode** that controls who writes the prose during drafting.

### Mode A — `author` (You write, AI assists)
- **You** write every word of `draft.md`
- AI interviews, organizes, tracks continuity, creates context files
- AI is your editor, continuity checker, and motivator
- Best if: You enjoy writing prose and want a smart assistant

### Mode B — `co-writer` (AI writes, you direct)
- **You** give high-level direction, constraints, and feedback
- **AI** generates prose, scenes, and dialogue
- You review, edit, and redirect
- Best if: You want to focus on story, not typing every sentence

**Key points:**
- Mode is **per-novel**, not global — each project stores its own mode in `metadata/writing_mode.md`
- Mode is **selectable at every session** — when you continue, it asks "Keep [author/co-writer] or switch?"
- Mode **only affects drafting** — planning phases (foundations, world, characters, plot) work the same in both modes
- Switching is **always allowed** — run `skill(name="write-novel-mode")` anytime

---

## All Available Skills

### Management Skills

| Skill | Purpose |
|-------|---------|
| `write-novel-init` | Create a new novel project (auto-names untitled1, untitled2, etc.) |
| `write-novel-use` | **Select** a project to work on (saves typing it every time) |
| `write-novel-unuse` | **Stop using** a project (go back to explicit selection) |
| `write-novel-rename` | Rename a project (especially for untitledN → real name) |
| `write-novel-status` | Check status of all projects or current project |
| `write-novel-mode` | Switch writing mode (`author` ↔ `co-writer`) |
| `write-novel-archive` | **Archive** a project (move to archives folder) |

### Phase Skills (Progressive Depth)

| Skill | Essentials | Optional Deep Dives |
|-------|-----------|---------------------|
| `write-novel-foundations` | Genre, audience, themes, logline | — |
| `write-novel-world` | Overview, geography, basic magic/tech | History, economy, politics, flora/fauna, factions, cultures, calendar, daily life |
| `write-novel-characters` | Protagonist/antagonist core (want/need/flaw), key cast list | Full profiles, Enneagram/MBTI, arc mapping, relationship webs, voice & POV |
| `write-novel-plot` | Choose structure, 7 key plot points, basic chapter breakdown | Complete beat sheets, detailed outlines, subplots, scene breakdowns, foreshadowing, pacing analysis |

| `write-novel-draft` | AGENTS.md context, write chapter draft | Scene breakdowns, revision notes, alternative drafts, writing analytics, deep context |
| `write-novel-compile` | Compile chapters into EPUB e-book | Preview mode (first 3 chapters), custom ranges, styling, front/back matter, convert to MOBI/PDF |

---

## How Progressive Depth Works

### Example: World Building Session

```
You run: skill(name="write-novel-world")

[PHASE 4A: ESSENTIALS]
✓ World overview (2-3 paragraphs)
✓ Geography & 3-5 key locations  
✓ Basic magic/technology rules
✓ Quick faction/culture notes

✅ Essentials Complete! Your world is functional.

Go deeper? Choose optional elements:
1. Detailed History & Timeline
2. Economic Systems & Trade
3. Political Structures
4. Flora, Fauna & Ecosystems
5. Calendar, Holidays & Time
6. Factions Deep Dive
7. Cultures Deep Dive
8. Daily Life (food, fashion, customs)
9. Done - move to Phase 4 (characters)

Your choice: 
```

**You can:**
- Pick **zero** optional items and move on immediately
- Pick **one or more** to explore now
- Come back **later** to add any optional element
- **Mix and match**—do some phases deep, others simple

### Progress Tracking

Each skill tracks your progress in `.ai/[phase]_progress_[project].md`:

```
MyNovel - World Building Progress
Last Updated: 2024-01-15

ESSENTIALS:
✅ World Overview
✅ Geography
✅ Magic System
✅ Quick Notes

OPTIONAL:
⏳ Detailed History (not started)
✅ Economic System (completed 2024-01-15)
⏳ Political Structures (not started)
✅ Factions Deep Dive (completed 2024-01-15) - 3 factions detailed
...
```

---

## Project Selection Flow

Each skill follows this priority:
1. **Project name provided** → Use it
2. **Project selected with `write-novel-use`** → Use selected project
3. **Neither** → Show numbered list of all projects

---

## Example Workflows

### Fast Path (Minimal)
```bash
skill(name="write-novel-init", user_message="MyNovel")
skill(name="write-novel-use", user_message="MyNovel")
skill(name="write-novel-foundations")  # Essentials
skill(name="write-novel-world")        # Essentials only → "Done? 9. Continue"
skill(name="write-novel-characters")   # Essentials only
skill(name="write-novel-plot")         # Essentials only
skill(name="write-novel-draft")        # Write with basic context
# Novel complete!
# Compile to EPUB and read it!
skill(name="write-novel-compile")      # Generate EPUB e-book
# Novel complete!
```

### Deep Path (Comprehensive)
```bash
# Same start...
skill(name="write-novel-world")
# Do essentials...
# Then select: 1. History, 2. Economy, 3. Politics, 5. Calendar, 6. Factions, 7. Cultures

skill(name="write-novel-characters")
# Do essentials...
# Then select: 1. Deep Protagonist, 4. Enneagram, 6. Relationship Webs, 7. Voice Notes

# ... continue adding depth where needed
# When ready to share or read:
skill(name="write-novel-compile")      # Generate EPUB with cover, TOC, metadata
```

### Mixed Path (Recommended)
```bash
skill(name="write-novel-world")        # Essentials only → move fast
skill(name="write-novel-characters")   # Essentials only → keep momentum
skill(name="write-novel-plot")         # Essentials only → start writing sooner
skill(name="write-novel-draft")        # Write 5 chapters...
# Realize world needs more depth
skill(name="write-novel-world")        # Add optional: politics & factions
# Continue drafting with better understanding...
# When draft is complete:
skill(name="write-novel-compile")      # Generate EPUB e-book to read/share
```

---

## Project Structure

Each novel project gets this structure:

```
MyNovel/
├── README.md               # Project overview & TODO list
├── metadata/
│   ├── genre.md
│   ├── target_audience.md
│   └── themes.md
├── world/                  # Essentials + Optional
│   ├── overview.md         # Essential
│   ├── geography.md        # Essential
│   ├── magic_system.md     # Essential
│   ├── notes.md            # Essential
│   ├── history_detailed.md # Optional
│   ├── economy.md          # Optional
│   ├── politics.md         # Optional
│   ├── ecosystem.md        # Optional
│   ├── factions/           # Basic notes (essential) + Detailed (optional)
│   └── cultures/           # Basic notes (essential) + Detailed (optional)
├── characters/             # Essentials + Optional
│   ├── protagonist.md      # Core (essential) + Deep (optional)
│   ├── antagonist.md       # Core (essential) + Deep (optional)
│   ├── notes.md            # Essential (cast list)
│   ├── personality_frameworks.md  # Optional
│   ├── arc_mapping.md      # Optional
│   ├── relationship_web.md # Optional
│   ├── voice_notes.md      # Optional
│   └── side/               # Optional detailed profiles
├── plot/                   # Essentials + Optional
│   ├── [structure]_basic.md     # Essential
│   ├── [structure]_detailed.md  # Optional
│   ├── chapter_outlines/
│   │   ├── overview.md          # Essential
│   │   ├── chapter_01_detailed.md  # Optional
│   │   └── ...
│   ├── subplots.md         # Optional
│   ├── foreshadowing.md    # Optional
│   └── pacing.md           # Optional
├── chapters/               # Drafts + Optional tools
│   ├── chapter_01/
│   │   ├── AGENTS.md            # Essential (basic context)
│   │   ├── AGENTS_detailed.md   # Optional (deep context)
│   │   ├── draft.md             # Essential (the chapter!)
│   │   ├── scenes.md            # Optional (scene breakdown)
│   │   └── revision_notes.md    # Optional (issues to fix)
│   └── chapter_02/
│       └── ...
├── exports/                # Compiled e-books
│   ├── MyNovel_v1.epub
│   ├── MyNovel_v2.pdf
│   └── ...
├── assets/                 # Covers, styling
│   ├── cover.jpg
│   └── style.css
└── appendix/
    └── inspiration.md
```

---

## Tips

### For Fast Writers
- Stick to essentials through all phases
- Add optional elements only when stuck or during revision
- Remember: Finished draft beats perfect outline

### For Planners
- Go deep on world, characters, and plot before drafting
- Use scene breakdowns and foreshadowing plans
- Build comprehensive series bible

### For Discovery Writers
- Do essentials fast, start drafting
- Add optional depth when the story demands it
- Use revision notes instead of detailed outlining

### For Everyone
- **Multiple novels**: Create many projects. Each gets its own git branch + folder (same kebab-case name)
- **Switch novels**: `write-novel-use` checks out the branch and cds into the folder automatically
- **Auto-naming**: Don't worry about the perfect name initially. Start with `write-novel-init` and rename later
- **Check status**: Run `write-novel-status` anytime to see where you left off
- **Git integrated**: Each novel is a branch; all novel work stays off `main`
- **Writing modes**: Choose `author` (you write, AI assists) or `co-writer` (AI writes, you direct) — switch anytime
- **Return anytime**: Re-run any phase skill to add optional elements later
- **Compile frequently**: Run `write-novel-compile` after each chapter to see your progress as a real book—great motivation!
- **Use Preview Mode**: Compile just the first 3 chapters to test formatting without waiting for the full book
- **Convert formats**: EPUB works everywhere except old Kindle. Use `ebook-convert` (Calibre) to make MOBI/AZW3 for Kindle or PDF for printing

---

## Prerequisites

To compile e-books, you need `pandoc` installed on your system:

**Arch Linux:**
```bash
sudo pacman -S pandoc
```

**Debian/Ubuntu:**
```bash
sudo apt-get install pandoc
```

**Fedora:**
```bash
sudo dnf install pandoc
```

**macOS:**
```bash
brew install pandoc
```

**Optional (for converting to other formats):**
- `calibre` — for MOBI/AZW3/PDF conversion via `ebook-convert`
  - Arch: `sudo pacman -S calibre`
- `texlive` — for PDF generation via pandoc
  - Arch: `sudo pacman -S texlive-latexrecommended` (covers most needs)
  - Arch (comprehensive): `sudo pacman -S texlive-latexrecommended texlive-latexextra`

---

## Getting Help

- `skill(name="write-novel-status")` - See what phase you're on and what's optional vs essential
- `skill(name="write-novel-use")` - Shows which project is currently selected
- `skill(name="write-novel-world")` (or any phase) - Shows your progress and available optional elements
- `skill(name="write-novel-compile")` - Compile your draft chapters into a readable EPUB e-book
- Each skill has its own detailed SKILL.md in `.ai/skills/[skill-name]/`

---

## The 80/20 Rule

**80% of your story comes from 20% of planning.**

**That 20% (Essentials):**
- Clear protagonist with want/need/flaw
- Antagonist who opposes them
- World that makes sense
- 7 key plot points
- Chapters roughly planned

**The other 80% (Optional):**
- Deep history, complex politics
- Psychological frameworks
- Detailed scene breakdowns
- Foreshadowing trackers

**Start with the 20%. Add from the 80% only where it serves the story.**

---

## Philosophy Summary

> "Perfectionism is the voice of the oppressor, the enemy of the people. It will keep you cramped and insane your whole life... I think perfectionism is based on the obsessive belief that if you run carefully enough, hitting each stepping-stone just right, you won't have to die. The truth is that you will die anyway and that a lot of people who aren't even looking at their feet are going to do a whole lot better than you, and have a lot more fun while they're doing it." 
> — Anne Lamott

**Write the story. Make it work. Make it better later.**

These skills support that philosophy by getting you writing fast while keeping rich tools available when you need them.
