
# CLI To-Do List (Week-1 — Bash, Linux, Git)
A tiny terminal to-do list written in Bash (WSL + vim).
Week-1 Linux + Git project: add / list / mark-done / delete tasks with persistence in plain text files.

## Features
- Add tasks (stored in tasklist.txt)

- List pending tasks

- Mark tasks as done (moves task to taskdone.txt)

- Delete pending tasks

- Persist data across sessions (plain text files)

- Built with standard POSIX tools: bash, grep, sed, nl

## Requirements
- Linux / WSL / macOS (bash)

- bash, grep, sed, nl (standard on most systems)

## Quick start

### Make Script Executable (one time)

    chmod +x todo-list.sh

### Run

     ./todo-list.sh 

#### Follow on-screen prompts:

- `1` Add Task

- `2` List Tasks (pending)

- `3` Mark Task as Done

- `4` List Tasks Done

- `5` Delete Task

- `6` Exit

### File layout / format
`tasklist.txt` — each line: Task description:Pending (only pending tasks live here)

`taskdone.txt` — each line: Task description:Done (completed tasks go here)

Filenames are case-sensitive. Use the lowercase names above. These files will be created automatically on execution.

## What I learned / what this project shows
- Basic Bash control flow (loops, if-else statements, switch case)

- File I/O and text processing with grep, sed, nl
- Text editing entirely on Vim
- Creating and running bash script on Linux System
- Maintaining code with Git and pushing it to GitHub
- Input validation and retry loops
