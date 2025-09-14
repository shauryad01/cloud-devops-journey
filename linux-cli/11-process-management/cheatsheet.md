# Cheatsheet: 11 - Process Management

## Process Basics

| Command                  | Description                         | Common Switches / Examples |
| ------------------------ | ----------------------------------- | -------------------------- |
| `ps`                     | Snapshot of current processes       | —                          |
| `ps aux`                 | Detailed list of all processes      | `ps aux \| less` |
| `ps -ef`                 | Full-format process listing         | —                          |
| `pgrep <name>`           | Find PID(s) by process name         | `pgrep sshd`               |
| `pidof <program>`        | Get PID directly                    | `pidof bash`               |
| `pstree`                 | Show parent-child process hierarchy | `pstree -p` shows PIDs     |
| `cat /proc/<PID>/status` | Inspect process info via `/proc`    | —                          |

---

## Monitoring

| Command                     | Description                 | Common Switches / Examples               |
| --------------------------- | --------------------------- | ---------------------------------------- |
| `top`                       | Real-time CPU/memory usage  | `M` sort by memory, `P` sort by CPU      |
| `htop`                      | Interactive process monitor | Scroll/search with arrows, `/` to filter |
| `uptime`                    | Show load averages          | —                                        |
| `watch -n 1 "ps aux \| grep user"` | Refresh command output continuously | Adjust `-n` for interval |


---

## Foreground, Background & Job Control

| Command       | Description                        | Common Switches / Examples |
| ------------- | ---------------------------------- | -------------------------- |
| `sleep 30`    | Run process in foreground          | —                          |
| `sleep 100 &` | Run process in background          | —                          |
| `Ctrl+Z`      | Suspend current foreground job     | —                          |
| `bg`          | Resume suspended job in background | —                          |
| `fg`          | Bring job back to foreground       | `fg %1` for specific job   |
| `jobs`        | List jobs in current shell         | —                          |
| `disown %1`   | Detach job from terminal           | —                          |

---

## Managing Processes

| Command          | Description                           | Common Switches / Examples |
| ---------------- | ------------------------------------- | -------------------------- |
| `kill <PID>`     | Send default SIGTERM (15)             | —                          |
| `kill -9 <PID>`  | Force kill with SIGKILL               | —                          |
| `pkill <name>`   | Kill process by name                  | `pkill firefox`            |
| `killall <name>` | Kill all processes with matching name | —                          |
| `kill -l`        | List available signals                | —                          |

---

## Priorities & Scheduling

| Command                 | Description                        | Common Switches / Examples |
| ----------------------- | ---------------------------------- | -------------------------- |
| `nice -n 10 <cmd>`      | Start process with lower priority  | `nice -n 15 sleep 100 &`   |
| `renice -n -5 -p <PID>` | Change priority of running process | —                          |
| `chrt -p <PID>`         | Show scheduling policy (optional)  | —                          |

---

## Daemons & Services

| Command                                 | Description                      | Common Switches / Examples |
|----------------------------------------|--------------------------------|----------------------------|
| `ps -ef \| grep systemd`                | Check systemd (PID 1)           | —                          |
| `ps -ef \| grep sshd`                   | Check SSH daemon                | —                          |
| `systemctl list-units --type=service`  | List services managed by systemd | Add `--state=running`      |

---

## Advanced Tools

| Command           | Description                              | Common Switches / Examples   |
|-------------------|----------------------------------------|------------------------------|
| `strace -p <PID>` | Attach and trace system calls of process | `strace -c ls` summary       |
| `strace ls`       | Trace syscalls of a command directly     | —                            |
| `pmap <PID>`      | Show process memory map                  | `pmap -x <PID>` extended     |
| `lsof -p <PID>`   | Show open files/sockets for a process   | `lsof -i :22` for port 22    |
| `lsof -i`         | Show all active network connections      | —                            |
| `time <cmd>`      | Measure execution time of a command      | `time sleep 2`               |

---

## Signals – Commonly Used

| Signal    | Number | Meaning / Use Case                                        |
|-----------|--------|----------------------------------------------------------|
| `SIGTERM` | 15     | Default kill — asks process to terminate gracefully.     |
| `SIGKILL` | 9      | Immediately kill process (cannot be trapped/ignored).    |
| `SIGSTOP` | 19     | Pause/suspend process (cannot be trapped).               |
| `SIGCONT` | 18     | Resume a stopped process.                                 |
| `SIGHUP`  | 1      | Hangup — often makes daemons reload config.              |
| `SIGINT`  | 2      | Interrupt — sent by `Ctrl+C` in terminal.                |
| `SIGQUIT` | 3      | Quit — sent by `Ctrl+\`, also produces core dump.        |
| `SIGUSR1` | 10     | User-defined signal (apps may implement custom behavior).|
| `SIGUSR2` | 12     | Another user-defined signal.                              |
| `SIGCHLD` | 17     | Sent to parent when child process terminates.            |
| `SIGTSTP` | 20     | Sent by `Ctrl+Z` to suspend foreground job.              |

---

## Key Notes

- **Process lifecycle**: Created → Ready → Running → Sleeping → Stopped → Zombie → Orphan → Terminated.
- **Foreground vs Background**: Foreground requires terminal interaction; background frees the shell.
- **Job control** (`bg`, `fg`, `disown`) is shell-level management of processes tied to your session.
- **Signals** let you communicate with processes; prefer `SIGTERM` before `SIGKILL` to allow cleanup.
- **Nice values**: Range from **-20 (highest priority)** to **19 (lowest priority)**. Default = 0.
- **Daemons**: Background services (`systemd`, `sshd`, `cron`) usually show TTY = `?`.
- **/proc filesystem** exposes process and kernel info — great for debugging.
- **strace/lsof/pmap** are admin-level debugging tools to see system calls, open files, and memory usage.

---

## Practical Scenarios

| Task                                    | Command Example                                 |
|-----------------------------------------|------------------------------------------------|
| Find top CPU hog                        | `ps aux --sort=-%cpu \| head -5`                |
| Find top memory hog                     | `ps aux --sort=-%mem \| head -5`                |
| Gracefully stop a process by name       | `pkill nginx`                                   |
| Force kill a stuck process by PID       | `kill -9 <PID>`                                 |
| Suspend then resume a job               | `sleep 200`, then `Ctrl+Z`, then `bg`, then `fg`|
| Reload a daemon without restarting      | `kill -SIGHUP <PID>`                            |
| Trace what a process is doing in kernel | `strace -p <PID>`                               |
| Check open ports/processes              | `lsof -i -P -n \| grep LISTEN`                   |
