# 11 – Linux Process Management

This chapter covers **process fundamentals, monitoring, job control, process creation, zombies & orphans, priorities, daemons, signal handling, and advanced Linux tools**. Understanding these concepts is essential for **Linux administration, DevOps, and system-level scripting**.

---

## 📌 What I Learned & Did

### **1. Process Fundamentals**

- Linux processes are instances of running programs, each with a unique **PID**.
- Key identifiers:

  - **PID** – Process ID
  - **PPID** – Parent Process ID
  - **UID** – User ID
  - **TTY** – Controlling terminal

- Process states: `running`, `sleeping`, `stopped`, `zombie`, `orphan`
- **Process Creation (Fork)**

  - `fork()` duplicates a process into a child process.
  - Every command, background job, or subshell triggers a fork behind the scenes.
  - Observe parent-child relationships: `pstree -p`

- **Zombies & Orphans**

  - Zombie: child exited but parent hasn’t collected its status → `<defunct>` in `ps`
  - Orphan: parent exits before child → adopted by `init` or `systemd`

- **Wait / Waitpid**

  - Parent can clean up child processes to prevent zombies using `wait` or `waitpid`

- **Sessions & Process Groups**

  - Processes are organized in **groups and sessions** for job control and terminal management
  - Check IDs: `ps -o pid,pgid,sid,cmd`

---

### **2. Listing & Inspecting Processes**

- `ps` – snapshot of running processes
- `ps aux` – all processes with details
- `ps -ef` – full-format listing
- `pgrep <name>` – find PID by process name
- `pidof <program>` – get PID directly
- `pstree` – view hierarchical tree of processes
- `/proc` filesystem:

  `ls /proc cat /proc/<PID>/status`

---

### **3. Monitoring Processes**

- `top` – real-time CPU/memory monitoring
- `htop` – interactive version of `top`
- `uptime` – check system load averages
- Watch processes continuously:

  `watch -n 1 "ps aux | grep <username>"`

---

### **4. Foreground, Background & Job Control**

- Run a process in foreground: `sleep 30`
- Background process: `sleep 100 &`
- Suspend job: `Ctrl+Z`
- Resume in background: `bg`
- Bring to foreground: `fg`
- List jobs: `jobs`
- Detach a job: `disown %1`
- **Long-running jobs detached from terminal:** `nohup long_running_command &`
- **Observe:** background processes continue running after closing the terminal

---

### **5. Managing Processes**

- Kill by PID: `kill <PID>`
- Force kill: `kill -9 <PID>`
- Kill by name: `pkill <process_name>`
- Kill all processes with same name: `killall <name>`
- View all signals: `kill -l`
- **Signal Handling / Traps in Bash**:

  `trap  "echo SIGINT received" SIGINT`

  - Learn how processes respond to signals

---

### **6. Priorities & Scheduling**

- Start process with custom priority: `nice -n 10 sleep 100 &`
- Change priority of running process: `renice -n -5 -p <PID>`
- Check scheduling policy (optional): `chrt -p <PID>`

---

### **7. Daemons & Services**

- User processes vs system daemons
- Identify daemons (TTY = `?`)
- Examples: `systemd`, `sshd`, `cron`
- Commands:

  `ps -ef | grep systemd
ps -ef | grep sshd
systemctl list-units --type=service --state=running`

---

### **8. Advanced Tools**

- Trace system calls: `strace -p <PID>`, `strace <command>`
- Check memory usage: `pmap <PID>`
- List open files: `lsof -p <PID>`
- Measure execution time: `time <command>`
- Extras:

  - `strace -c <command>` – syscall summary
  - `pmap -x <PID>` – detailed memory info
  - `lsof -i` – view open network sockets

---

## 📝 Why This Matters

- Inspecting, monitoring, and killing processes is critical for **debugging and stability**
- Job control (`bg`, `fg`, `disown`, `nohup`) is key for multitasking and **long-running jobs**
- Priorities (`nice`, `renice`) let you **tune performance**
- Forking and `wait`/`waitpid` allow **child process creation and cleanup**, avoiding zombies
- Understanding **zombies, orphans, sessions, and process groups** ensures stable server operation
- Signal handling shows how processes respond to **shutdowns and interrupts**
- Daemons/services maintain system availability — essential for **DevOps & Linux admin**
- Advanced tools provide **deep insight into what processes are doing under the hood**

---

## 🔗 Useful Links

- [Linux Process Management – GeeksforGeeks](https://www.geeksforgeeks.org/linux-unix/process-management-in-linux/)
- [Linux Processes – TLDP](https://tldp.org/LDP/tlk/kernel/processes.html)
- [ps(1) – Linux manual page](https://man7.org/linux/man-pages/man1/ps.1.html)
- [top(1) – Linux manual page](https://man7.org/linux/man-pages/man1/top.1.html)
- [kill(1) – Linux manual page](https://man7.org/linux/man-pages/man1/kill.1.html)
- [strace(1) – Linux manual page](https://man7.org/linux/man-pages/man1/strace.1.html)
- [Signal Handling - GeeksforGeeks](https://www.geeksforgeeks.org/linux-unix/signal-handling-in-linux-through-the-signal-function/)
- [Job Control in Bash – GNU Bash Manual](https://www.gnu.org/software/bash/manual/html_node/Job-Control-Basics.html)
