# Write Novel - Phase 6: Drafting & Refinement

## Purpose
Write chapter drafts with essential context and support, then optionally layer revision notes, scene breakdowns, and advanced writing tools.

## Philosophy
**Forward Motion First**: The goal is words on page. Everything else (outlining scenes, tracking metrics, revision notes) supports the writing but isn't required to produce a draft.

## Behavior

### 1. Directory Validation
- Working directory must be the repo root (where `.git/` lives)

### 2. Project Selection
1. **If project name provided**: Use that project
2. **If no project name**: Check for stored current project in `.ai/.current_project`
   - If stored project exists: Use stored project
   - If no stored project: List all projects, show numbered list, prompt for selection

### 3. Phase Validation
- Check if Phase 5 is complete (`/plot/chapter_outlines/overview.md` exists and NOT empty)
- If not: "Complete Phase 5 first with write-novel-plot (at minimum, create the chapter breakdown overview.md)"
- Show current drafting progress

### 4. Drafting Structure

#### **PHASE 6A: ESSENTIAL DRAFTING** (The Core Activity)

**Step 1: Chapter Selection** (ESSENTIAL)

Show progress overview:
```
📚 [Project Name] - Drafting Progress

Chapters: [X] drafted of [Y] total
Current word count: [Z]

Status:
1. Chapter 1 - Opening ✅ Drafted ([word count] words)
2. Chapter 2 - The Journey ⏳ Not started
3. Chapter 3 - First Conflict ⏳ Not started
4. ...

Options:
1. Continue to next un-drafted chapter (Chapter 2)
2. Select specific chapter to work on
3. Revise existing draft
4. View full progress

Your choice:
```

**Step 2: Essential Context** → Create `/chapters/chapter_NN/AGENTS.md` (ESSENTIAL)

*Pre-requisite*: Execute a semantic search (via `write-novel-rag` methodology) for the characters and locations in this chapter within `/world/` and `/characters/` to inject precise lore.

Generate context file with:
```markdown
# Chapter [N] Context

## Chapter Goals
- **Main Goal**: [What this chapter must achieve]
- **Key Events**: [2-3 critical moments]
- **Character Beat**: [Protagonist's emotional journey]

## Context
- **Previous Chapter**: [What just happened]
- **Current Location**: [Where scene takes place]
- **Characters Present**: [Who is here]

## Writing Support
- **Opening Hook**: [How to start with impact]
- **Ending Hook**: [What to leave reader wondering]
- **Tone**: [Emotional atmosphere]
- **Style & Length**: [Read `metadata/style_guide.md` and `metadata/banned_tropes.md` if they exist. Inherit the target word count and stylistic anti-AI rules to ensure deep, human-like chapters]
```

**Step 3: Write the Draft** → `/chapters/chapter_NN/draft.md` (ESSENTIAL)

**Behavior depends on `metadata/writing_mode.md`:**

---

**If mode = `author` (You write, AI assists):**

The AI sets up the context, asks clarifying questions, then **steps back** while you write.

1. Present the AGENTS.md context
2. Ask: "Ready to write Chapter [N]? Any questions before you start?"
3. When you finish writing: "Paste your draft or let me know when you're done."
4. Offer: continuity check, tone feedback, or "next chapter?"

Drafting mode options:
1. **Free Write** - You write, AI stays quiet until you ask for help
2. **Guided** - AI checks in at quarter marks with prompts
3. **Sprint Mode** - Timed sessions, AI counts words and cheers

**Minimum requirement**: You write the chapter. AI never generates prose unprompted.

---

**If mode = `co-writer` (AI writes, you direct):**

The AI generates prose. You review, edit, and redirect.

1. Present the AGENTS.md context
2. Ask: "What should happen in this chapter? Any constraints?"
3. AI generates a first draft of the chapter
4. You review and say: "Good, but make the dialogue sharper" or "Rewrite scene 2 from her POV"
5. Iterate until satisfied

**Minimum requirement**: AI generates draft.md. You approve or revise.

---

**If mode = `synthfic` (AI writes autonomously in batches):**

The AI generates prose autonomously without stopping for each chapter, relying purely on the established data.

1. AI reads the high-level outline and continuity tracker (or `database.json`).
2. AI automatically performs RAG retrieval for the entities in the chapter and generates the AGENTS.md context.
3. AI generates the draft.md for the chapter.
4. AI updates the `continuity_tracker.md` AND `plot/database.json` with the events of the chapter.
5. AI repeats this process for the requested batch size.
6. Only stop and ask for review when the batch is complete or the `/goal` is met.

**Minimum requirement**: AI generates multiple draft.md files autonomously.

---

💡 Switch modes anytime with `skill(name="write-novel-mode")`.

---

#### **PHASE 6B: OPTIONAL WRITING TOOLS** (Enhancement Layer)

After completing a chapter draft (behavior varies by mode):

**If mode = `author`:**
```
✅ Chapter [N] Draft Complete!

📊 Stats:
   Words written: [count]
   Time spent: [if tracked]

Great job! You wrote this. What's next?

1. Continue to next chapter
2. Add scene breakdown (divide chapter into scenes)
3. Add revision notes for later
4. View writing analytics
5. Take a break and check progress

Your choice:
```

**If mode = `co-writer`:**
```
🤖 Chapter [N] Draft Generated!

📊 Stats:
   Words generated: [count]
   Revision cycles: [N]

What's next?

1. ✅ Accept and continue to next chapter
2. ✏️  Edit this chapter (you rewrite parts)
3. 🔄 Ask AI to revise (give new direction)
4. 📝 Add scene breakdown
5. ⏸️  Take a break and check progress

Your choice:
```

**If mode = `synthfic`:**
```
🤖 Batch of [X] Chapters Generated!

📊 Stats:
   Total words generated: [count]
   Chapters generated: [list of chapters]

What's next?

1. ✅ Accept batch and continue to next batch
2. ✏️  Review and edit specific chapters
3. ⏸️  Take a break and check progress

Your choice:
```

**Optional Tools:**

**1. Scene Breakdown** → `/chapters/chapter_NN/scenes.md` (OPTIONAL)

Divide chapter into individual scenes:
```markdown
# Chapter [N] Scene Breakdown

## Scene 1: [Title]
- **Pages**: [Start]-[End]
- **POV**: [Character]
- **Goal**: 
- **Conflict**: 
- **Outcome**: 
- **Notes**: 

## Scene 2: [Title]
...
```

Benefits:
- See pacing within chapter
- Identify scenes that need work
- Check goal-conflict-outcome for each scene

**2. Revision Notes** → `/chapters/chapter_NN/revision_notes.md` (OPTIONAL)

While writing, note issues for later:
```markdown
# Chapter [N] Revision Notes

## Known Issues
- [ ] Fix dialogue in scene 2 (sounds too formal)
- [ ] Add sensory details to location description
- [ ] Check timeline (does this take place morning or afternoon?)

## Expansion Opportunities
- Could add flashback to protagonist's childhood here
- Secondary character reaction could be stronger

## Questions to Resolve
- What does [object] look like exactly?
- How does [character] know this information?
```

**3. Alternative Draft** → `/chapters/chapter_NN/draft_v2.md` (OPTIONAL)

Try different approaches:
- Different POV character
- Different opening
- Different tone
- Cut version (what's the minimum this chapter needs?)

**4. Writing Analytics** → `/chapters/writing_stats.md` (OPTIONAL)

Track metrics across chapters:
```markdown
# Writing Analytics

## By Chapter
| Chapter | Word Count | Time | Words/Hour | Mood |
|---------|-----------|------|------------|------|
| 1 | 2500 | 2h | 1250 | Easy |
| 2 | 1800 | 3h | 600 | Hard |

## Patterns
- Best writing time: [When?]
- Most productive location: [Where?]
- Average chapter length: [Words]

## Targets
- Daily word goal: [Number]
- Chapter target: [Number]
- Total novel target: [Number]
```

**5. Deep AGENTS.md** → `/chapters/chapter_NN/AGENTS_detailed.md` (OPTIONAL)

More comprehensive context for AI assistance:
```markdown
# Detailed Chapter Context

## Thematic Elements
- **Theme**: [How this chapter explores theme]
- **Symbols**: [Objects/images to include]
- **Motifs**: [Recurring elements]

## Character Voices
- **Protagonist**: [Speech patterns, vocabulary]
- **Antagonist**: [How they speak]
- **Other Characters**: [Distinctive voices]

## Sensory Details
- **Visual**: [What to see]
- **Auditory**: [What to hear]
- **Smell/Taste**: [Other senses]
- **Texture**: [Physical sensations]

## Research Integration
- [Specific facts to include]
- [Historical details]
- [Technical accuracy]

## Emotional Beats
- **Opening emotion**: 
- **Emotional journey**: 
- **Closing emotion**: 
```

**6. Beat Sheet Check** (OPTIONAL)

If using Save the Cat or other structure, verify chapter aligns:
```
This is Chapter [N], targeting [Beat Name] at [Percentage].

✓ Opening Image beat should establish status quo
✓ Theme should be stated subtly
✓ Character should show flaw
```

### 5. Drafting Modes

**Essential Mode - Just Write:**
- Show AGENTS.md
- Start writing
- Save at end
- Done

**Optional Mode - Enhanced:**
- Scene breakdowns
- Revision notes
- Analytics tracking
- Multiple drafts

### 6. Progress Tracking

**Drafting Progress File** → `.ai/drafting_progress_[project].md`
```
[Project Name] - Drafting Progress
Last Updated: [Date]

OVERALL:
- Total Chapters: [Y]
- Drafted: [X] ([percentage]%)
- Current Word Count: [Z]
- Target Word Count: [W] (if set)

CHAPTER STATUS:
1. Chapter 1 - ✅ Drafted ([count] words) [date]
   ⏳ Scene breakdown (optional, not done)
   ⏳ Revision notes (optional, not done)
2. Chapter 2 - ⏳ Not started
3. Chapter 3 - ⏳ Not started
...

WRITING STATS:
- Total writing time: [Hours]
- Average words/hour: [Number]
- Best day: [Date] - [Count] words
- Current streak: [Days]
```

### 7. Git Operations
- Commit after each chapter draft: "Draft: Chapter [N] - [word count] words"
- Commit optional files separately: "Add scene breakdown for Chapter [N]"
- Regular commits to preserve progress

### 8. Output

**After First Chapter (mode-aware):**

*author mode:*
```
✅ Chapter [N] Drafted!

📊 Stats:
   Words: [count]
   Chapter: [N] of [Total]
   Progress: [X]% complete

📝 You wrote! The hardest part is starting.

💡 Options:
   1. Keep momentum - draft next chapter
   2. Add optional tools (scenes, notes, analytics)
   3. Take a break - your progress is saved
   4. Check overall progress

⏭️  Next: `write-novel-draft [project-name]` (continues to next chapter)
```

*co-writer mode:*
```
✅ Chapter [N] Drafted!

📊 Stats:
   Words: [count]
   Chapter: [N] of [Total]
   Progress: [X]% complete

🤖 AI generated the draft. You reviewed and approved.

💡 Options:
   1. Keep momentum - draft next chapter
   2. Edit this chapter before moving on
   3. Take a break - your progress is saved
   4. Check overall progress

⏭️  Next: `write-novel-draft [project-name]` (continues to next chapter)
```

**After Completing Draft (All Chapters):**
```
🎉 FIRST DRAFT COMPLETE!

📊 Final Stats:
   Total Chapters: [Y]
   Total Words: [Z]
   Writing Period: [Start] to [End]

🏆 You did it! You have a complete novel draft.

📋 What's Next?
   1. Take a break (seriously, let it rest)
   2. Start revision pass
   3. Add optional revision tools to existing chapters
   4. Celebrate this achievement!

💡 Pro tip: Put the draft in a drawer for 2-4 weeks before revising.
   You'll see it with fresh eyes.
```

**Mid-Draft Motivation:**

*author mode:*
```
📊 Drafting Progress: [X]% Complete

Chapters drafted: [N] of [Total]
Words written by you: [Count]

🎯 You're [percentage] done!

💪 Keep going!
   - The middle is the hardest part
   - Momentum beats perfection
   - You can fix it in revision

⏭️  Ready for Chapter [N+1]?
```

*co-writer mode:*
```
📊 Drafting Progress: [X]% Complete

Chapters drafted: [N] of [Total]
Words generated: [Count]

🎯 You're [percentage] done!

💪 Keep going!
   - The middle is the hardest part
   - Your direction shapes the story
   - Revision polishes the prose

⏭️  Ready for Chapter [N+1]?
```

### 9. Resuming Progress

When returning to drafting:
```
📍 Welcome back to [Project Name]!

Last worked on: Chapter [N] ([date])
Total progress: [X]%

Quick options:
1. Continue where you left off (Chapter [N+1])
2. Revise Chapter [N]
3. Jump to different chapter
4. View full progress report
5. Add optional tools to completed chapters

What would you like to do?
```

## Usage Examples

```bash
# Continue drafting (next un-drafted chapter)
skill(name="write-novel-draft")

# Work on specific chapter
skill(name="write-novel-draft", user_message="MyFantasyNovel chapter 5")

# Check progress
skill(name="write-novel-draft", user_message="MyFantasyNovel progress")

# Just show what chapter is next
skill(name="write-novel-draft", user_message="MyFantasyNovel next")
```

## File Structure

```
chapters/
├── chapter_01/
│   ├── AGENTS.md              # Essential (basic context)
│   ├── AGENTS_detailed.md     # Optional (comprehensive context)
│   ├── draft.md               # Essential (the chapter)
│   ├── scenes.md              # Optional (scene breakdown)
│   ├── revision_notes.md      # Optional (issues to fix)
│   └── draft_v2.md            # Optional (alternative version)
├── chapter_02/
│   ├── AGENTS.md
│   └── draft.md
├── chapter_03/
│   ...
└── writing_stats.md           # Optional (analytics)
```

## Philosophy

**The Essential Truth:**
A finished draft beats a perfect outline. The goal of this phase is forward motion—words accumulating into chapters, chapters into a novel.

**The Optional Value:**
Scene breakdowns help you see structure. Revision notes capture insights while fresh. Analytics reveal patterns. But none of these matter if you don't write the words first.

**Drafting Advice:**

1. **Permission to Be Messy**: First drafts are supposed to be rough
2. **Forward Only**: Don't edit while drafting (unless it's a quick fix)
3. **Momentum Over Perfection**: 500 bad words today beat 0 perfect words
4. **Know Your Next Scene**: Before stopping, jot down what happens next
5. **Celebrate Milestones**: Every chapter finished is an achievement

**When to Use Optional Tools:**
- Scene breakdowns: When chapter feels bloated or unclear
- Revision notes: When you spot issues but don't want to stop flow
- Alternative drafts: When chapter isn't working and you want to explore
- Analytics: When you want to gamify or understand your process

**When to Just Write:**
- When you're in flow
- When deadline approaches
- When inspiration strikes
- Always, really—optional tools are for breaks between writing

**The Drafting Paradox:**
The best way to write a novel is to write badly. Perfectionism kills drafts. This skill system protects you from overthinking by making "just write" the essential path and everything else supportive decoration.
