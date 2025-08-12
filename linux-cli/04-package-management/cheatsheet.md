# Cheatsheet: 04 - Package-Management (Ubuntu/Debian)

## **APT (Advanced Package Tool)**

| Command | Description | Common Switches / Notes |
| ------- | ----------- | ----------------------- |
| `sudo apt update` | Refresh package list from repositories | Must run before upgrading/installing to get latest info |
| `sudo apt upgrade` | Upgrade all installed packages to latest version | `-y` auto-confirm |
| `sudo apt full-upgrade` | Upgrade with package removals if required | More aggressive than `upgrade` |
| `sudo apt install <package>` | Install a package from repos | `-y` auto-confirm, `--reinstall` force reinstall |
| `sudo apt remove <package>` | Remove package (keep config files) | |
| `sudo apt purge <package>` | Remove package and config files | |
| `sudo apt search <keyword>` | Search packages by name/description | |
| `apt show <package>` | Show package details | Works without sudo |
| `sudo apt autoremove` | Remove unused dependencies | Useful after removing packages |
| `sudo apt clean` | Remove cached package files (`.deb`) | Frees space |
| `sudo apt autoclean` | Remove outdated cached packages | |

---

## **dpkg (Debian Package Manager)**

| Command | Description | Common Switches / Notes |
| ------- | ----------- | ----------------------- |
| `sudo dpkg -i <file.deb>` | Install `.deb` package | Use `apt -f install` if dependencies missing |
| `dpkg -l` | List all installed packages | Can filter: `dpkg -l \| grep <name>` |
| `dpkg -s <package>` | Show status & info about installed package | |
| `dpkg -L <package>` | List files installed by package | |
| `dpkg -S <filename>` | Find which package owns a file | |
| `sudo dpkg -r <package>` | Remove package (keep configs) | |
| `sudo dpkg --purge <package>` | Remove package + configs | |

---

## **Snap (Universal Linux Packages)**

| Command | Description | Common Switches / Notes |
| ------- | ----------- | ----------------------- |
| `sudo snap install <package>` | Install snap package | `--classic` for classic confinement |
| `sudo snap remove <package>` | Remove snap package | |
| `snap list` | List installed snap packages | |
| `snap info <package>` | View package info | |
| `snap refresh` | Update all snaps | |

---

## **Package Info & Troubleshooting**

| Command | Description | Notes |
| ------- | ----------- | ----- |
| `apt list --installed` | List installed apt packages | Can pipe to `grep` for search |
| `apt list --upgradable` | Show packages with available updates | |
| `apt-cache depends <package>` | Show package dependencies | |
| `apt-cache rdepends <package>` | Show packages depending on this package | |
| `which <command>` | Show path of installed program | |
| `whereis <command>` | Show binary, source, man locations | |

---

## **Important Package Management Paths**

| Path | Purpose |
| ---- | ------- |
| `/etc/apt/sources.list` | Main list of APT repositories |
| `/etc/apt/sources.list.d/` | Extra repository definitions |
| `/var/cache/apt/archives/` | Cached `.deb` files |
| `/var/lib/dpkg/` | dpkg database & status files |
| `/var/log/apt/` | APT logs |
| `/snap/` | Snap package files |
| `/var/lib/snapd/` | Snap runtime data |
