# Cheatsheet: 13 - System Info & Disk Management

## System Information

| Command               | Description                          | Example / Notes                    |
| --------------------- | ------------------------------------ | ---------------------------------- | --- |
| `uname -a`            | Kernel name, version, architecture   | `Linux ip-172... x86_64 GNU/Linux` |
| `hostname`            | Show hostname                        | —                                  |
| `hostnamectl`         | Detailed system hostname info        | Includes OS + kernel metadata      |
| `uptime`              | Show uptime + load averages          | `19:04:34 up 1 day, load avg: 0.1` |
| `w` / `who`           | Show logged-in users                 | —                                  |
| `last`                | Show login history                   | —                                  |
| `lastb`               | Show failed login attempts           | Needs `sudo`                       |
| `lsb_release -a`      | Distro information                   | Ubuntu, Debian, etc.               |
| `cat /etc/os-release` | OS release details                   | KEY=VALUE format                   |
| `arch` / `nproc`      | Architecture / CPU count             | —                                  |
| `lscpu`               | Detailed CPU info                    | Model, cores, threads              |
| `free -h`             | Memory + swap usage (human readable) | —                                  |
| `vmstat 1`            | Realtime memory, CPU, I/O stats      | Updates every 1s                   |
| `dmesg                | less`                                | Kernel logs / hardware messages    |     |

---

## Disk & Filesystem Usage

| Command             | Description                         | Example / Notes        |
| ------------------- | ----------------------------------- | ---------------------- | --------------------- | --- |
| `lsblk`             | Show block devices + partitions     | `lsblk -f` for FS info |
| `df -h`             | Disk usage in human readable format | —                      |
| `df -i`             | Inode usage                         | —                      |
| `du -sh <dir>`      | Show total directory size           | `du -sh /var/log`      |
| `du -ah             | sort -rh                            | head`                  | Largest files/subdirs |     |
| `mount` / `findmnt` | Show mounted filesystems            | —                      |
| `blkid`             | Show device UUIDs                   | Use for `/etc/fstab`   |
| `cat /etc/fstab`    | Persistent mount config             | —                      |

---

## Partitions & New Disks

| Command                             | Description                  | Example / Notes                |
| ----------------------------------- | ---------------------------- | ------------------------------ |
| `sudo fdisk -l`                     | List partition table         | —                              |
| `sudo fdisk /dev/xvdf`              | Open fdisk for a disk        | `n`=new, `d`=delete, `w`=write |
| `parted` / `gdisk`                  | Advanced partitioning tools  | —                              |
| `mkfs.ext4 /dev/sdXn`               | Format partition as ext4     | `mkfs.ext4 /dev/xvdf1`         |
| `sudo mkdir /mnt/newdisk`           | Make a mount point           | —                              |
| `sudo mount /dev/sdXn /mnt/newdisk` | Mount partition to directory | —                              |
| `sudo umount /mnt/newdisk`          | Unmount partition            | —                              |
| `ls -lh /dev/disk/by-uuid/`         | Get UUIDs                    | For `/etc/fstab` entries       |

---

## LVM (Logical Volume Manager)

| Command                                      | Description            | Example / Notes       |
| -------------------------------------------- | ---------------------- | --------------------- |
| `pvcreate /dev/sdX`                          | Create physical volume | `pvcreate /dev/xvdf1` |
| `vgcreate vg1 /dev/sdX`                      | Create volume group    | —                     |
| `lvcreate -L 5G -n lv1 vg1`                  | Create logical volume  | 5 GB LV named lv1     |
| `mkfs.ext4 /dev/vg1/lv1`                     | Format logical volume  | —                     |
| `mount /dev/vg1/lv1 /mnt/lv1`                | Mount LV               | —                     |
| `lvextend -L +2G /dev/vg1/lv1` + `resize2fs` | Extend LV + resize FS  | Grow storage live     |

---

## Swap Space

| Command                                           | Description          | Example / Notes |
| ------------------------------------------------- | -------------------- | --------------- |
| `swapon --show`                                   | Show active swap     | —               |
| `sudo fallocate -l 1G /swapfile`                  | Allocate swap file   | 1 GB size       |
| `chmod 600 /swapfile`                             | Secure permissions   | —               |
| `mkswap /swapfile`                                | Set as swap          | —               |
| `sudo swapon /swapfile`                           | Enable swap          | —               |
| Add to `/etc/fstab`: `/swapfile none swap sw 0 0` | Make swap persistent | —               |

---

## Disk Monitoring

| Command  | Description                     | Notes                  |
| -------- | ------------------------------- | ---------------------- |
| `iostat` | CPU + I/O usage per device      | From `sysstat` package |
| `iotop`  | Per-process I/O usage           | Needs sudo             |
| `ncdu`   | Interactive disk usage analyzer | Great for cleanup      |

---

## Hardware Info

| Command       | Description                      | Example / Notes   |
| ------------- | -------------------------------- | ----------------- |
| `lshw -short` | System hardware overview         | Needs sudo        |
| `lspci`       | PCI devices (network, GPU, etc.) | —                 |
| `lsusb`       | USB devices                      | —                 |
| `dmidecode`   | BIOS / firmware info             | Needs sudo        |
| `sensors`     | Temperature + fan sensors        | From `lm-sensors` |
