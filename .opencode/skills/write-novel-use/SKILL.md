# Write Novel - Use Project

## Purpose
Select a project to work on so you don't have to specify it in every subsequent skill command.

## Behavior

### 1. Directory Validation
- Working directory must be: `/home/dubyte/Documents/Workspace/words/`

### 2. Project Selection (if no name provided)
- List all projects in the words folder
- Show as numbered list
- Prompt user to select which project to use

### 3. Validation
- Check if project exists
- If not: Error "Project '[name]' does not exist."

### 4. Storage
- Store project name in: `/home/dubyte/Documents/Workspace/words/.opencode/.current_project`
- Simple text file containing just the project name

### 5. Output
```
✅ Now using project: [project-name]

📁 Location: /home/dubyte/Documents/Workspace/words/[project-name]/

💡 Next skills will use this project automatically:
   skill(name="write-novel-foundations")  # Works on [project-name]
   skill(name="write-novel-world")        # Works on [project-name]
   
📋 To check current project: skill(name="write-novel-use")
🗑️  To stop using: skill(name="write-novel-unuse")
```

### 6. Show Current (if run without args)
If `.current_project` file exists and user runs skill without args:
```
📌 Currently using project: [project-name]

📁 Location: /home/dubyte/Documents/Workspace/words/[project-name]/

To switch: skill(name="write-novel-use", user_message="OtherProject")
To stop:   skill(name="write-novel-unuse")
```

## Usage Examples

```bash
# Select specific project
skill(name="write-novel-use", user_message="MyFantasyNovel")

# Interactive mode (shows list)
skill(name="write-novel-use")

# Check which project is currently selected
skill(name="write-novel-use")  # Shows current if already set
```

## Error Handling
- Wrong directory: "Error: Must run from /home/dubyte/Documents/Workspace/words/"
- Project not found: "Error: Project '[name]' does not exist."
- No projects: "No projects found. Create one with write-novel-init first."

## Notes
- Stored in `.opencode/.current_project` (hidden file)
- All other skills check this file if no project name provided
- Persistent across sessions
