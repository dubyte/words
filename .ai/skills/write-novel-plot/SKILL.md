# Write Novel - Phase 5: Plot & Structure

## Purpose
Structure your story with essential plot points first, then optionally layer complexity through subplots, scenes, and advanced techniques.

## Writing Mode Note
This phase works identically in both `author` and `co-writer` modes — the AI interviews and you answer. Mode only affects the drafting phase.

## Philosophy
**Skeleton First, Muscles Later**: A story needs a clear beginning, middle, and end to function. Everything else adds richness but isn't required to start drafting.

## Behavior

### 1. Directory Validation
- Working directory must be the repo root (where `.git/` lives)

### 2. Project Selection
1. **If project name provided**: Use that project
2. **If no project name**: Check for stored current project in `.ai/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Phase Validation
- Check if Phase 4 is complete (`/characters/protagonist.md` not empty)
- If not: "Complete Phase 4 first with write-novel-characters"
- Check if Phase 5 essentials exist (`/plot/chapter_outlines/overview.md` exists and NOT empty)
- If has content: Show current structure/chapters and offer to continue or view

### 4. Plot Structure

#### **PHASE 5A: ESSENTIALS** (Required to proceed)

**Step 1: Choose Your Structure** (ESSENTIAL)

Present options and let user choose one:
- **Three-Act Structure** - Classic setup/confrontation/resolution
- **Save the Cat Beat Sheet** - 15 beats with percentages  
- **Hero's Journey** - 12 stages of transformation
- **Seven Point Structure** - Working backward from ending
- **Custom/Freeform** - Create your own structure

Create corresponding file based on choice.

**Step 2: Core Plot Points** (ESSENTIAL)

Define these 7 critical moments (adapt to chosen structure):

1. **Opening** (0-10%)
   - Status quo, protagonist introduced
   - What's missing in their life?

2. **Inciting Incident** (10%)
   - What disrupts the status quo?
   - Why can't they ignore it?

3. **First Major Decision** (25%)
   - Point of no return
   - They commit to the journey

4. **Midpoint** (50%)
   - False victory OR false defeat
   - Stakes raised, new information

5. **Crisis** (75%)
   - All seems lost
   - Rock bottom moment

6. **Climax** (90%)
   - Final confrontation
   - Protagonist faces their flaw/fear

7. **Resolution** (95-100%)
   - New status quo
   - How has protagonist changed?

**Step 3: Basic Chapter Breakdown** (ESSENTIAL)

Create `/plot/chapter_outlines/overview.md`:
- Divide story into chapters (estimate: 20-40 for novel)
- For each chapter: 1-2 sentences on what happens
- Ensure plot points are distributed appropriately
- Include protagonist's emotional state arc

Minimum per chapter:
- Chapter number and working title
- What happens (1-2 sentences)
- Whose POV (if multiple)

---

#### **PHASE 5B: OPTIONAL DEEP DIVES** (Can skip entirely)

After essentials complete:
```
✅ Plot Essentials Complete!

Structure chosen ✓
7 key plot points ✓
Basic chapter breakdown ✓

Go deeper? Choose optional elements:
1. Complete Beat Sheet (fill all beats for chosen structure)
2. Detailed Chapter Outlines (full template per chapter)
3. Subplots & B-Stories (add secondary storylines)
4. Scene Breakdown (list every scene in story)
5. Foreshadowing Plan (plant seeds for later payoff)
6. Pacing Analysis (check tension/emotional rhythm)
7. Theme Integration (map theme to plot beats)
8. Character Arc Tracking (plot beats character changes)
9. Done - move to Phase 6 (drafting)

Your choice (1-9):
```

**Optional Details:**

**1. Complete Beat Sheet** → Full `/plot/[structure]_detailed.md` (OPTIONAL)
Fill in ALL beats for chosen structure:

**Save the Cat (all 15 beats):**
- Opening Image (0-1%)
- Theme Stated (5%)
- Set-Up (1-10%)
- Catalyst (10%)
- Debate (10-20%)
- Break Into Two (20%)
- B Story (22%)
- Fun and Games (20-50%)
- Midpoint (50%)
- Bad Guys Close In (50-75%)
- All Is Lost (75%)
- Dark Night of the Soul (75-80%)
- Break Into Three (80%)
- Finale (80-99%)
- Final Image (99-100%)

**Hero's Journey (all 12 stages):**
- Ordinary World
- Call to Adventure
- Refusal of the Call
- Meeting the Mentor
- Crossing the First Threshold
- Tests, Allies, Enemies
- Approach to the Inmost Cave
- The Ordeal
- Reward
- The Road Back
- Resurrection
- Return with the Elixir

**2. Detailed Chapter Outlines** → `/plot/chapter_outlines/chapter_NN_detailed.md` (OPTIONAL)

For each chapter, full template:
```markdown
# Chapter [N]: [Title]

## Purpose
[What this chapter achieves for the story]

## Key Events
- [Event 1]
- [Event 2]
- [Event 3]

## Character Beats
- **[Protagonist]**: [Emotional state, development]
- **[Other Character]**: [What they do/feel]

## Setting
- **Location**: 
- **Time of day**: 
- **Atmosphere**: 

## POV
- **Character**: [Whose perspective]
- **Why**: [Why this POV serves the scene]

## Emotional Tone
- **Scene starts**: [Emotion]
- **Scene ends**: [Emotion]
- **Shift**: [What causes emotional change]

## Scene Type
- [ ] Action (something happens)
- [ ] Reaction (character processes)
- [ ] Transition (time/place change)
- [ ] Setup (planting information)

## Open Questions
- [What should reader be wondering?]

## Notes
[Any additional notes]
```

**3. Subplots & B-Stories** → `/plot/subplots.md` (OPTIONAL)

For each subplot:
- **Type**: Romance / Mystery / Character Arc / Mirror / Comic Relief
- **Characters involved**: 
- **Setup**: When/how it begins
- **Development**: Key moments
- **Integration**: How it affects main plot
- **Resolution**: How it ends

**4. Scene Breakdown** → `/plot/scenes.md` or spreadsheet (OPTIONAL)

List every scene:
```
Scene | Chapter | POV | Goal | Conflict | Outcome | Notes
1 | 1 | Prot | Establish world | None yet | Normal day | Opening image
2 | 1 | Prot | Get to work | Late! | Arrives flustered | Inciting incident setup
```

**5. Foreshadowing Plan** → `/plot/foreshadowing.md` (OPTIONAL)

Track seeds and payoffs:
```
| Plant (Scene) | Payoff (Scene) | What | Notes |
|---------------|----------------|------|-------|
| Ch 2 | Ch 15 | Protag can't swim | Drowning climax |
| Ch 3 | Ch 12 | Mysterious key | Opens villain's lair |
```

**6. Pacing Analysis** → `/plot/pacing.md` (OPTIONAL)

Map emotional rhythm:
```
Chapter | Tension Level | Emotion | Pacing Note
1 | 2/10 | Curiosity | Slow, atmospheric
5 | 8/10 | Anxiety | Fast, urgent
10 | 5/10 | Reflection | Medium, processing
```

Check for:
- Too many high-tension chapters in a row
- Sagging middle (chapters 15-25 often slow)
- Balance of action/reaction scenes

**7. Theme Integration** → `/plot/theme_integration.md` (OPTIONAL)

Map how theme appears:
```
| Plot Point | Theme Moment | How Theme Shown |
|------------|--------------|-----------------|
| Inciting Incident | Sacrifice introduced | Character gives up comfort |
| Midpoint | Cost of sacrifice | Lost friendship |
| Climax | Full sacrifice | Gives up life goal |
```

**8. Character Arc Tracking** → `/plot/character_arc_tracking.md` (OPTIONAL)

Map character change to plot:
```
| Story Point | External Event | Internal State | Arc Progress |
|-------------|----------------|----------------|--------------|
| Opening | Normal life | Selfish | Starting flaw |
| Catalyst | Opportunity | Interested | Seeds of change |
| Midpoint | Betrayal | Doubting self | Crisis of faith |
| Climax | Final battle | Selfless | Transformation complete |
```

### 5. Plot Templates

**Three-Act Structure Template:**
```markdown
# Three-Act Structure

## ACT 1: SETUP (0-25%)
### Opening (0-5%)
- 

### Inciting Incident (10%)
- 

### First Plot Point (25%)
- Point of no return
- 

## ACT 2: CONFRONTATION (25-75%)
### Rising Action (25-50%)
- 

### Midpoint (50%)
- False victory or false defeat
- 

### Complications (50-75%)
- 

### Crisis (75%)
- All seems lost
- 

## ACT 3: RESOLUTION (75-100%)
### Climax (90%)
- Final confrontation
- 

### Resolution (95-100%)
- New normal
- 
```

**Save the Cat Template:**
(See full 15 beats above)

**Hero's Journey Template:**
(See full 12 stages above)

### 6. Session Management

**Progress Tracking** → `.ai/plot_progress_[project].md`
```
[Project Name] - Plot Progress
Last Updated: [Date]

STRUCTURE: [Chosen method]

ESSENTIALS:
✅ Structure chosen: [Method]
✅ 7 key plot points defined
✅ Basic chapter breakdown: [N] chapters

OPTIONAL DEEP DIVES:
⏳ Complete beat sheet (not started)
⏳ Detailed chapter outlines (not started)
⏳ Subplots & B-stories (not started)
⏳ Scene breakdown (not started)
⏳ Foreshadowing plan (not started)
⏳ Pacing analysis (not started)
⏳ Theme integration (not started)
⏳ Character arc tracking (not started)
```

### 7. Output

**After Essentials:**
```
✅ Phase 5A Complete: Plot Essentials

📁 Essential files created:
   - plot/[chosen_structure].md
   - plot/chapter_outlines/overview.md ([N] chapters)

📝 Your story has structure!

Key defined:
• Structure: [Method]
• 7 major plot points mapped
• [N] chapters outlined (basic)

💡 Options:
   1. Go deeper: Run `write-novel-plot` to add optional elements
   2. Continue: Run `write-novel-draft` to start writing
   3. Check progress: Run `write-novel-plot` to see optional elements

⏭️  Next: `write-novel-draft [project-name]` (or add plot depth first)
```

**After Optional Content:**
```
✅ Plot Deep Dive Progress

📁 Files created/updated:
   [List of completed optional elements]

📊 Progress:
   Essentials: ✅ Complete
   Optional: [X] of [Y] elements explored

💡 You can:
   1. Add more plot depth: Run `write-novel-plot` again
   2. Start drafting: Run `write-novel-draft`
   3. Add complexity during revision

⏭️  Next: `write-novel-draft [project-name]`
```

### 8. Resuming Progress

When run on existing project:
```
📍 Phase 5: Plot & Structure - Progress Check

✅ ESSENTIALS COMPLETE
   Structure: [Method] ✓
   7 plot points ✓
   Chapter breakdown ✓

📋 OPTIONAL ELEMENTS:
   ⏳ Complete beat sheet - Press 1
   ✅ Detailed outlines - Completed (chapters 1-10)
   ⏳ Subplots - Press 3
   ...

What would you like to do?
1. Add optional depth (choose from list)
2. Refine chapter outlines
3. Continue to Phase 6 (drafting)
4. Mark Phase 5 complete and move on

Your choice:
```

## Usage Examples

```bash
# First run - do essentials
skill(name="write-novel-plot", user_message="MyFantasyNovel")

# Second run - add optional depth
skill(name="write-novel-plot")

# Check progress
skill(name="write-novel-plot")
```

## File Structure

```
plot/
├── [structure]_basic.md        # Essential (7 key points)
├── [structure]_detailed.md     # Optional (complete beat sheet)
├── chapter_outlines/
│   ├── overview.md             # Essential (basic per chapter)
│   ├── chapter_01_detailed.md  # Optional (full template)
│   ├── chapter_02_detailed.md  # Optional
│   └── ...
├── subplots.md                 # Optional
├── scenes.md                   # Optional
├── foreshadowing.md            # Optional
├── pacing.md                   # Optional
├── theme_integration.md        # Optional
└── character_arc_tracking.md   # Optional
```

## Philosophy

**Plot Essentials = Story Can Be Written**
- You know beginning, middle, end
- You know major turning points
- You know roughly what happens in each chapter

**Plot Optional = Story Can Be Written Better**
- Complete beat sheets help pacing
- Subplots add complexity
- Foreshadowing creates satisfaction
- Scene breakdowns help for complex narratives

**When to Use Optional:**
- Mystery novels (need foreshadowing)
- Complex narratives (multiple timelines)
- Character-driven stories (need arc tracking)
- Series (need detailed bible)
- During revision (pacing analysis)

**When Essentials Are Enough:**
- Fast drafting (NaNoWriMo)
- Discovery writing (you find story by writing)
- Simple narratives
- First drafts
- Action-focused stories

**The Paradox:**
Some writers need detailed outlines to write.
Others are paralyzed by too much planning.
This system serves both—get essentials fast, then choose your depth.
