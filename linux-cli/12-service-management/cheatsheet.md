# Cheatsheet: 12 – Service Management (systemd)

---

## **Basic Syntax**

| Command                         | Description                             | Example                |
| ------------------------------- | --------------------------------------- | ---------------------- |
| `systemctl [command] [service]` | Manage a service (start, stop, enable…) | `systemctl start sshd` |

---

## **Starting & Stopping Services**

| Command                     | Description                | Example                  |
| --------------------------- | -------------------------- | ------------------------ |
| `systemctl start <service>` | Start a service            | `systemctl start sshd`   |
| `systemctl stop <service>`  | Stop a service             | `systemctl stop sshd`    |
| `systemctl restart <svc>`   | Restart service            | `systemctl restart sshd` |
| `systemctl reload <svc>`    | Reload config (no restart) | `systemctl reload httpd` |

---

## **Enable & Disable at Boot**

| Command                       | Description             | Example                       |
| ----------------------------- | ----------------------- | ----------------------------- |
| `systemctl enable <service>`  | Enable service at boot  | `systemctl enable firewalld`  |
| `systemctl disable <service>` | Disable service at boot | `systemctl disable firewalld` |
| `systemctl is-enabled <svc>`  | Check if enabled        | `systemctl is-enabled sshd`   |

---

## **Checking Service Status**

| Command                               | Description                  | Example                 |
| ------------------------------------- | ---------------------------- | ----------------------- |
| `systemctl status <service>`          | Show service status          | `systemctl status sshd` |
| `systemctl list-units --type=service` | List active services         | —                       |
| `systemctl --failed`                  | Show failed services         | —                       |
| `systemctl show <service>`            | Show full service properties | `systemctl show sshd`   |
| `systemctl cat <service>`             | Show unit file               | `systemctl cat sshd`    |

---

## **Masking & Unmasking Services**

| Command                      | Description                        | Example                   |
| ---------------------------- | ---------------------------------- | ------------------------- |
| `systemctl mask <service>`   | Prevent service from being started | `systemctl mask mysqld`   |
| `systemctl unmask <service>` | Allow service to start again       | `systemctl unmask mysqld` |

---

## **Targets (Runlevels)**

| Command                          | Description                  | Example                                  |
| -------------------------------- | ---------------------------- | ---------------------------------------- |
| `systemctl get-default`          | Show default target          | —                                        |
| `systemctl set-default <target>` | Set default target           | `systemctl set-default graphical.target` |
| `systemctl isolate <target>`     | Switch immediately to target | `systemctl isolate multi-user.target`    |

---

## **Unit Files**

| Command                     | Description                            | Example                |
| --------------------------- | -------------------------------------- | ---------------------- |
| `systemctl list-unit-files` | List all unit files (enabled/disabled) | —                      |
| `systemctl edit <service>`  | Edit unit safely (override file)       | `systemctl edit nginx` |
| `systemctl daemon-reload`   | Reload unit files after changes        | —                      |
| `systemctl daemon-reexec`   | Restart systemd itself                 | —                      |

---

## **System Control (Power Management)**

| Command              | Description      | Example |
| -------------------- | ---------------- | ------- |
| `systemctl poweroff` | Power off system | —       |
| `systemctl reboot`   | Reboot system    | —       |
| `systemctl halt`     | Halt system      | —       |

---

## **Useful Options**

| Option                    | Description                                        | Example                                                 |
| ------------------------- | -------------------------------------------------- | ------------------------------------------------------- |
| `--version`               | Show version of systemctl                          | `systemctl --version`                                   |
| `--help`                  | Show help/manual                                   | `systemctl --help`                                      |
| `--type=service`          | Filter by unit type                                | `systemctl list-units --type=service`                   |
| `--all`                   | Show inactive units too                            | `systemctl list-units --all`                            |
| `--failed`                | Show failed units                                  | `systemctl --failed`                                    |
| `--user`                  | Manage user-level services                         | `systemctl --user start myapp`                          |
| `--force`                 | Force stop/start                                   | `systemctl stop --force httpd.service`                  |
| `--no-block`              | Don’t block shell                                  | `systemctl start --no-block httpd.service`              |
| `--state=`                | Filter by state                                    | `systemctl list-units --state=failed`                   |
| `-r, --recursive`         | Show units of local containers                     | `systemctl list-units --recursive`                      |
| `--show-types`            | Show socket types                                  | `systemctl list-sockets --show-types`                   |
| `--job-mode=`             | Control queued jobs (`replace`, `fail`, `isolate`) | `systemctl isolate graphical.target --job-mode=replace` |
| `-i, --ignore-inhibitors` | Ignore inhibitor locks                             | `systemctl poweroff --ignore-inhibitors`                |
| `-q, --quiet`             | Suppress output                                    | `systemctl daemon-reload --quiet`                       |
| `--no-wall`               | No broadcast message before shutdown               | `systemctl halt --no-wall`                              |

---
