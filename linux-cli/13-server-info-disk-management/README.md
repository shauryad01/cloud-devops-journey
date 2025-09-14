# 13 – System Info, Disk Management & Hardware

This section covered how to inspect system information, manage disks and partitions, work with filesystems, explore LVM and swap, and check hardware details. I practiced all of these directly on my AWS EC2 instance (free tier) with an attached EBS volume.

---

## 📌 What I Did

1.  **Checked System Information**

    - `uname -a` → kernel name, version, architecture.
    - `hostname` / `hostnamectl` → system hostname and metadata.
    - `uptime` → running time + load averages.
    - `w` / `who` → see logged-in users.
    - `last`, `lastb` → login and failed login history.
    - `lsb_release -a` / `cat /etc/os-release` → distro info.
    - `arch`, `lscpu`, `nproc` → CPU details.
    - `free -h` / `vmstat 1` → RAM + swap usage.
    - `dmesg | less` → kernel messages.

2.  **Disk & Filesystem Basics**

    - `lsblk` → list block devices and partitions.
    - `df -h` → disk usage by filesystem.
    - `df -i` → inode usage.
    - `du -sh <dir>` → directory size.
    - `du -ah | sort -rh | head -20` → find largest files.
    - `mount`, `findmnt` → see mounted filesystems.
    - `blkid` → device UUIDs.
    - `cat /etc/fstab` → persistent mounts.

3.  **Partitions & New Disks**

    - Added a new EBS volume in AWS.
    - `sudo fdisk -l` → list partition tables.
    - `fdisk /dev/xvdf` → interactive partition tool:

      - `n` → create partition.
      - `d` → delete partition.
      - `w` → write changes.

    - `mkfs.ext4 /dev/xvdf1` → format as ext4.
    - `sudo mkdir /mnt/newdisk && sudo mount /dev/xvdf1 /mnt/newdisk`.
    - `umount /mnt/newdisk` → safely unmount.
    - `ls -lh /dev/disk/by-uuid/` → get UUID for `/etc/fstab`.

4.  **LVM (Logical Volume Manager)**

    - `pvcreate /dev/xvdf1` → physical volume.
    - `vgcreate vg1 /dev/xvdf1` → volume group.
    - `lvcreate -L 5G -n lv1 vg1` → logical volume.
    - `mkfs.ext4 /dev/vg1/lv1 && mount /dev/vg1/lv1 /mnt/lv1`.
    - Learned that LVM allows resizing and combining volumes flexibly.

5.  **Swap Space**

        - `swapon --show` → check active swap.
        - Created a swap file:

          `sudo fallocate -l 1G /swapfile chmod 600 /swapfile

    mkswap /swapfile
    sudo swapon /swapfile`

        - Added entry to `/etc/fstab` for persistence.

6.  **Disk Monitoring**

    - `iostat` (sysstat) → I/O performance.
    - `iotop` → per-process I/O usage.
    - `ncdu` → interactive disk usage analyzer.

7.  **Hardware Information**

    - `lshw -short` → hardware overview.
    - `lspci` → PCI devices (network, GPU).
    - `lsusb` → USB devices.
    - `dmidecode` → BIOS, system board.
    - `sensors` → CPU temps, fans.

---

## 📝 Why This Matters

- Understanding **system info** is crucial for debugging, performance tuning, and resource checks.
- Disk management is fundamental for setting up storage in cloud environments like AWS.
- LVM provides flexibility for scaling and reorganizing storage without downtime.
- Swap ensures stability when memory runs out, even though it’s slower than RAM.
- Monitoring and hardware inspection are core sysadmin tasks for performance and troubleshooting.

---

## 🔗 Useful Links

- [Linux Handbook- Disk Management](https://linuxhandbook.com/tag/disk-management/)

- [GNU Coreutils Reference](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [AWS Docs – Adding EBS Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html)
