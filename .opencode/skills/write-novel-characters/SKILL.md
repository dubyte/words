# Write Novel - Phase 4: Character Development

## Purpose
Create essential character foundations first, then optionally explore deep psychology, relationships, and voice.

## Philosophy
**Start Simple, Go Deep**: Every story needs a protagonist and antagonist with clear wants/needs. Everything else enhances but isn't required to start writing.

## Behavior

### 1. Directory Validation
- Working directory must be: `[workspace]/`

### 2. Project Selection
1. **If project name provided**: Use that project
2. **If no project name**: Check for stored current project in `.opencode/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Phase Validation
- Check if Phase 3 is complete (`/world/overview.md` not empty)
- If not: "Complete Phase 3 first with write-novel-world"
- Check existing character files
- If exists: Show progress and offer to continue or view

### 4. Character Development Structure

#### **PHASE 4A: ESSENTIALS** (Required to proceed)

**A. Protagonist - Core** → `/characters/protagonist.md` (ESSENTIAL)

Minimum required:
- **Name** and one-line description
- **What they WANT** (external goal)
- **What they NEED** (internal growth)
- **Their FLAW** (what's holding them back)
- **STAKES** (what happens if they fail?)
- **Starting state** (where they begin emotionally/physically)
- **Ending state** (where they must end up)

**B. Antagonist - Core** → `/characters/antagonist.md` (ESSENTIAL)

Minimum required:
- **Name** and one-line description
- **What they WANT** (opposes protagonist's goal)
- **Why they oppose protagonist** (motivation)
- **Their STRENGTH** (why they're a threat)
- **Relationship to protagonist** (personal/professional/ideological)

**C. Key Supporting Cast** → `/characters/notes.md` (ESSENTIAL)

List only (details come later):
- 2-4 important side characters
- One line each: Name + Role in story + Relationship to protagonist

---

#### **PHASE 4B: OPTIONAL DEEP DIVES** (Can skip entirely or add any)

After completing essentials, skill will ask:
```
✅ Character Essentials Complete!

Protagonist core ✓
Antagonist core ✓
Key cast listed ✓

Go deeper? Choose optional elements:
1. Protagonist Deep Dive (appearance, backstory, voice)
2. Antagonist Deep Dive (full profile, backstory, complexity)
3. Detailed Side Characters (full profiles for key cast)
4. Personality Frameworks (Enneagram, MBTI for main characters)
5. Character Arc Mapping (detailed transformation steps)
6. Relationship Webs (map all character connections)
7. Character Voice & POV (how each character speaks/thinks)
8. Additional Characters (create more side characters)
9. Done - move to Phase 5

Your choice (1-9):
```

**Deep Dive Details:**

**1. Protagonist Deep Dive** → Enhance `/characters/protagonist.md` (OPTIONAL)
- Full physical description
- Detailed backstory (childhood, formative events)
- Daily habits and quirks
- Fears and phobias
- Skills and abilities
- What they carry (items of significance)

**2. Antagonist Deep Dive** → Enhance `/characters/antagonist.md` (OPTIONAL)
- Full physical description
- Detailed backstory (how they became antagonist)
- Complexity (sympathetic elements?)
- Minions/allies
- Weaknesses protagonist can exploit
- Their own character arc (do they change?)

**3. Detailed Side Characters** → Create `/characters/side/[name].md` (OPTIONAL)
For each key side character:
- Core details (name, age, appearance)
- Role in story
- Relationship to protagonist
- What they want
- Character arc (if any)
- Distinctive voice/trait

**4. Personality Frameworks** → `/characters/personality_frameworks.md` (OPTIONAL)
- Enneagram types (1-9) for main characters
- MBTI types (16 personalities)
- Why these types fit the character
- Growth paths for each type

**5. Character Arc Mapping** → `/characters/arc_mapping.md` (OPTIONAL)
Detailed transformation for protagonist:
- Arc type (Change, Flat, Fall, Redemption)
- Beat-by-beat transformation
- Specific scenes showing change
- Internal vs external conflicts at each stage

**6. Relationship Webs** → `/characters/relationship_web.md` (OPTIONAL)
Visual/text map:
```
Protagonist ←[rivalry]→ Antagonist
Protagonist ←[friendship]→ SideCharacterA
Protagonist ←[romance]→ SideCharacterB
Antagonist ←[alliance]→ SideCharacterC
```
Include:
- Type of relationship
- Power dynamics
- History between characters
- How relationships change

**7. Character Voice & POV** → `/characters/voice_notes.md` (OPTIONAL)
For each POV character:
- Vocabulary level and word choices
- Speech patterns (formal/casual, dialect)
- Internal monologue style
- What they notice (reflects their interests/fears)
- Dialogue quirks (repeated phrases, interruptions)

**8. Additional Characters** → Create more (OPTIONAL)
- Mentors
- Comic relief characters
- Red herrings (mystery stories)
- Love interests
- Henchmen/minions

### 5. Character Profile Templates

**Essential Template (Minimum):**
```markdown
# Character: [Name]

## Core
- **Role**: Protagonist/Antagonist/Supporting
- **One-line**: [Brief description]

## Motivation
- **Wants**: [External goal]
- **Needs**: [Internal growth]
- **Stakes**: [What happens if they fail?]

## Character
- **Flaw**: [What's holding them back?]
- **Strength**: [Key ability or trait]

## Arc
- **Starts**: [Beginning state]
- **Ends**: [Transformed state]

## Relationships
- **With [Protagonist/Antagonist]**: [Brief dynamic]
```

**Deep Dive Template (Full):**
```markdown
# Character: [Name]

## Core Details
- **Full Name**: 
- **Nicknames/Aliases**: 
- **Age**: 
- **Physical Appearance**: 
- **Distinctive Marks**: 
- **Style of Dress**: 
- **Voice/Speech**: 

## Psychology
- **Enneagram Type**: [Type] - [Description]
- **MBTI Type**: [Type] - [Description]
- **Core Fear**: 
- **Core Desire**: 
- **Core Beliefs**: 
- **Fatal Flaw**: 
- **Greatest Strength**: 

## Background
- **Birthplace**: 
- **Family**: 
- **Childhood**: 
- **Formative Events**: 
- **Education**: 

## Motivations & Goals
- **External Goal (Wants)**: 
- **Internal Need**: 
- **Why It Matters**: 
- **Obstacles**: 

## Character Arc
- **Arc Type**: [Change/Flat/Fall/Redemption]
- **Starting State**: 
- **Inciting Incident Impact**: 
- **Midpoint Realization**: 
- **All Is Lost Moment**: 
- **Transformation**: 
- **Ending State**: 

## Relationships
- **[Character A]**: [Type] - [Dynamic]
- **[Character B]**: [Type] - [Dynamic]

## Daily Life
- **Occupation**: 
- **Habits**: 
- **Hobbies**: 
- **What They Carry**: 

## Voice Notes
- **Vocabulary**: 
- **Speech Patterns**: 
- **Common Phrases**: 
- **Internal Monologue Style**: 

## Story Function
- **Role**: [Hero/Mentor/Ally/Trickster/etc.]
- **Purpose in Plot**: 
- **Theme Representation**: 
```

### 6. Session Management

**Progress Tracking** → `.opencode/characters_progress_[project].md`
```
[Project Name] - Character Development Progress
Last Updated: [Date]

ESSENTIALS:
✅ Protagonist Core
✅ Antagonist Core  
✅ Key Cast List (4 characters)

OPTIONAL DEEP DIVES:
⏳ Protagonist Deep Dive (not started)
⏳ Antagonist Deep Dive (not started)
✅ Side Character Details (2 detailed)
⏳ Personality Frameworks (not started)
⏳ Arc Mapping (not started)
⏳ Relationship Webs (not started)
⏳ Voice & POV (not started)
⏳ Additional Characters (not started)
```

**During Sessions:**
- Can complete multiple optional elements
- Can skip any element
- Can add characters incrementally
- Tracks which characters have essential vs full profiles

### 7. Output

**After Essentials:**
```
✅ Phase 4A Complete: Character Essentials

📁 Essential files created:
   - characters/protagonist.md (core)
   - characters/antagonist.md (core)
   - characters/notes.md (key cast list)

📝 You have functional characters ready to drive the story!

Key defined:
• Protagonist wants: [X], needs: [Y], flaw: [Z]
• Antagonist opposes because: [reason]
• [N] supporting characters identified

💡 Options:
   1. Go deeper: Run `write-novel-characters` to add optional depth
   2. Continue: Run `write-novel-plot` to structure the story
   3. Check progress: Run `write-novel-characters` to see optional elements

⏭️  Next: `write-novel-plot [project-name]` (or add character depth first)
```

**After Optional Content:**
```
✅ Character Deep Dive Progress

📁 Files created/updated:
   [List of completed optional elements]

📊 Progress:
   Essentials: ✅ Complete
   Optional: [X] of [Y] elements explored
   Characters detailed: [N] full profiles

💡 You can:
   1. Add more depth: Run `write-novel-characters` again
   2. Continue to Phase 5: Run `write-novel-plot`
   3. Add more characters anytime

⏭️  Next: `write-novel-plot [project-name]`
```

### 8. Resuming Progress

When run on existing project:
```
📍 Phase 4: Character Development - Progress Check

✅ ESSENTIALS COMPLETE
   Protagonist core ✓
   Antagonist core ✓
   Key cast listed ✓

📋 OPTIONAL ELEMENTS:
   ⏳ Protagonist Deep Dive - Press 1
   ✅ Antagonist Deep Dive - Completed
   ⏳ Side Character Details - Press 3
   ⏳ Personality Frameworks - Press 4
   ...

What would you like to do?
1. Add optional depth (choose from list)
2. Create additional characters
3. View relationship web
4. Continue to Phase 5 (plot)
5. Mark Phase 4 complete and move on

Your choice:
```

## Usage Examples

```bash
# First run - do essentials
skill(name="write-novel-characters", user_message="MyFantasyNovel")

# Second run - add optional depth
skill(name="write-novel-characters")

# Check progress
skill(name="write-novel-characters")
```

## File Structure

```
characters/
├── protagonist.md              # Essential (core) + Optional (deep dive)
├── antagonist.md               # Essential (core) + Optional (deep dive)
├── notes.md                    # Essential (key cast list)
├── personality_frameworks.md   # Optional
├── arc_mapping.md              # Optional
├── relationship_web.md         # Optional
├── voice_notes.md              # Optional
└── side/
    ├── ally_a.md               # Optional (full profile)
    ├── mentor.md               # Optional (full profile)
    └── love_interest.md        # Optional (full profile)
```

## Philosophy

**Why This Approach Works:**

1. **Avoids Analysis Paralysis**: You don't need 20-page character bibles to start
2. **Functional First**: Essentials give you characters who can drive scenes
3. **Depth On Demand**: Add complexity where the story actually needs it
4. **Flexible**: Can write with basic characters and deepen as you discover them
5. **Momentum**: Get to writing faster while still having direction

**The 80/20 Rule:**
- 80% of character work in a novel comes from 20% of these details
- Essentials = that crucial 20%
- Optional deep dives = the enriching 80% that comes later or incrementally

**When to Go Deep:**
- When a character isn't "clicking" in scenes
- When you need to understand motivation for a specific plot beat
- During revision to add dimension
- When the story demands complexity (political intrigue, psychological depth)

**When Essentials Are Enough:**
- Action/adventure stories
- Plot-driven narratives
- First drafts
- NaNoWriMo/fast drafting
- When you discover characters best by writing them
