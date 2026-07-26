---
name: write-novel-world
description: Build the novel's setting with locations, cultures, history, magic systems, and other world elements.
---
# Write Novel - Phase 3: World Building

## Purpose
Build out the novel's setting with essential foundations first, then optionally explore deeper world elements.

## Writing Mode Note
This phase works identically in both `author` and `co-writer` modes — the AI interviews and you answer. Mode only affects the drafting phase.

## Philosophy
**Progressive Depth**: Start with what's essential for the story, add depth as needed. Everything optional can be added later.

## Behavior

### 1. Directory Validation
- Working directory must be the repo root (where `.git/` lives)

### 2. Project Selection
1. **If project name provided**: Use that project
2. **If no project name**: Check for stored current project in `.ai/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Phase Validation
- Check if Phase 2 is complete (`/metadata/genre.md` not empty)
- If Phase 2 not complete: "Complete Phase 2 first with write-novel-foundations"
- Check if Phase 3 already has content (`/world/overview.md`)
- If has content: Offer to continue, overwrite, or view current

### 4. World Building Structure

#### **PHASE 3A: ESSENTIALS** (Required to proceed)

These elements are necessary for a functional world:

**A. World Overview** → `/world/overview.md` (ESSENTIAL)
- High-level description (2-3 paragraphs)
- Time period/era
- Overall atmosphere and tone
- What makes this world unique?

**B. Geography & Key Locations** → `/world/geography.md` (ESSENTIAL)
- 3-5 important locations for your story
- Brief description of each
- Climate/atmosphere of key areas
- How locations relate to each other

**C. Magic System / Technology** → `/world/magic_system.md` (ESSENTIAL - if applicable)
- Basic rules: Who can use it? How?
- 1-2 key limitations or costs
- How it affects daily life (briefly)

**D. Quick Factions/Cultures Note** → `/world/notes.md` (ESSENTIAL)
- List major groups that affect the story (can be detailed later)
- One-line description of each
- Their relationship to protagonist

---

#### **PHASE 3B: OPTIONAL DEEP DIVES** (Can skip entirely or add any/all)

After completing essentials, skill will ask:
```
✅ Essentials Complete!

World overview ✓
Geography ✓
Magic/Technology ✓
Quick notes ✓

Go deeper? Choose optional elements to add:
1. Detailed History (timeline, major events)
2. Economic System (trade, currency, resources)
3. Political Structures (governments, laws, power)
4. Flora & Fauna (ecosystems, creatures)
5. Calendar & Time (holidays, seasons, timekeeping)
6. Factions Deep Dive (create detailed faction files)
7. Cultures Deep Dive (create detailed culture files)
8. Daily Life (food, fashion, customs)
9. Done - move to Phase 4

Your choice (1-9):
```

**If user chooses a deep dive, guide through:**

**Detailed History** → `/world/history_detailed.md` (OPTIONAL)
- Timeline of major events
- Historical figures
- How past shapes present
- Create `/world/timeline.md` if needed

**Economic System** → `/world/economy.md` (OPTIONAL)
- Currency and trade
- Scarce resources
- Social classes
- Trade routes

**Political Structures** → `/world/politics.md` (OPTIONAL)
- Government types
- Laws and justice systems
- Power struggles
- Foreign relations

**Flora & Fauna** → `/world/ecosystem.md` (OPTIONAL)
- Native species
- Dangerous creatures
- Plants used for magic/medicine
- Domesticated animals

**Calendar & Time** → `/world/calendar.md` (OPTIONAL)
- Different from Earth time?
- Important holidays/festivals
- Seasonal variations
- Special days (eclipses, celestial events)

**Factions Deep Dive** → Create `/world/factions/[faction_name].md` (OPTIONAL)
For each major faction:
- History and founding
- Structure and leadership
- Goals and motivations
- Conflicts with other factions
- Relationship to protagonist

**Cultures Deep Dive** → Create `/world/cultures/[culture_name].md` (OPTIONAL)
For each major culture:
- Values and beliefs
- Social norms and taboos
- Traditions and rituals
- Clothing and architecture
- Language and naming patterns

**Daily Life** → `/world/daily_life.md` (OPTIONAL)
- Common foods and meals
- Clothing by social class
- Architecture styles
- Entertainment and leisure
- Greetings and customs

### 5. Session Management

**During any session:**
- Can complete multiple optional elements
- Can skip any element and return later
- Skill tracks what's been created in `.ai/world_progress_[project].md`

**Tracking File Format:**
```
[Project Name] - World Building Progress
Last Updated: [Date]

ESSENTIALS:
✅ World Overview
✅ Geography
✅ Magic/Technology
✅ Quick Notes

OPTIONAL:
⏳ Detailed History (not started)
✅ Economic System (completed [date])
⏳ Political Structures (not started)
⏳ Flora & Fauna (not started)
✅ Factions Deep Dive (completed [date]) - 3 factions
⏳ Cultures Deep Dive (not started)
⏳ Calendar & Time (not started)
⏳ Daily Life (not started)
```

### 6. Git Operations
- Commit after each completed section (essential or optional)
- Commit message: "Phase 3: Add [section] for [project-name]"
- If multiple optional sections in one session: "Phase 3: Add [list] for [project-name]"

### 7. Output Modes

**After Essentials Only:**
```
✅ Phase 3A Complete: World Building Essentials

📁 Essential files created:
   - world/overview.md
   - world/geography.md
   - world/magic_system.md
   - world/notes.md

📝 You have a functional world! 

💡 Options:
   1. Go deeper: Run `write-novel-world` again to add optional elements
   2. Continue: Run `write-novel-characters` to develop characters
   3. Check progress: Run `write-novel-world` to see what's optional vs essential

⏭️  Next: `write-novel-characters [project-name]` (or add more world details first)
```

**After Adding Optional Content:**
```
✅ Phase 3 Deep Dive Progress

📁 Files created/updated:
   [List of everything done this session]

📊 Progress:
   Essentials: ✅ Complete
   Optional: [X] of [Y] elements explored

💡 You can:
   1. Add more optional elements: Run `write-novel-world` again
   2. Continue to Phase 4: Run `write-novel-characters`
   3. Check full progress: Run `write-novel-world`

⏭️  Next: `write-novel-characters [project-name]`
```

### 8. Resuming Progress

When skill is run on project with existing Phase 3 content:
```
📍 Phase 3: World Building - Progress Check

✅ ESSENTIALS COMPLETE
   World overview ✓
   Geography ✓
   Magic/Technology ✓

📋 OPTIONAL ELEMENTS:
   ⏳ History (not started) - Press 1 to add
   ✅ Economy (completed)
   ⏳ Politics (not started) - Press 3 to add
   ✅ Factions (3 detailed) - Press 6 to add more
   ...

What would you like to do?
1. Add optional: History
2. Add optional: Politics
3. Add optional: Factions
4. View all optional options
5. Continue to Phase 4 (characters)
6. Mark Phase 3 complete and move on

Your choice:
```

## Usage Examples

```bash
# First run - do essentials
skill(name="write-novel-world", user_message="MyFantasyNovel")

# Second run - add optional elements
skill(name="write-novel-world")

# Check progress on current project
skill(name="write-novel-world")

# Work on specific optional element (if implemented)
skill(name="write-novel-world", user_message="MyFantasyNovel economy")
```

## File Structure After Essentials Only

```
world/
├── overview.md          # Essential
├── geography.md         # Essential
├── magic_system.md      # Essential
├── notes.md            # Essential
├── history_detailed.md  # Optional - if added
├── economy.md          # Optional - if added
├── politics.md         # Optional - if added
├── ecosystem.md        # Optional - if added
├── calendar.md         # Optional - if added
├── daily_life.md       # Optional - if added
├── factions/           # Essential (basic notes) + Optional (detailed files)
│   ├── faction_a_detailed.md  # Optional
│   └── faction_b_detailed.md  # Optional
└── cultures/           # Essential (basic notes) + Optional (detailed files)
    ├── culture_x_detailed.md  # Optional
    └── culture_y_detailed.md  # Optional
```

## Error Handling
- Wrong directory: "Error: Must run from the repository root"
- Phase 2 incomplete: "Complete Phase 2 first with write-novel-foundations"
- No progress file issues: Create new, don't error

## Philosophy Notes

**Essential = Story Cannot Function Without It**
- Reader needs to understand where/when story happens
- Key locations must be established
- Rules of the world (magic/tech) must be clear

**Optional = Enhances But Not Required**
- Deep history adds flavor but story works without it
- Economic systems create realism but aren't plot-critical
- Can be added anytime (even after drafting starts)

**Progressive Approach Benefits:**
1. Not overwhelmed by 50 world-building questions upfront
2. Can start writing sooner
3. Can add depth where story actually needs it
4. Avoids world-building procrastination
5. Maintains momentum through the process
