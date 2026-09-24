## Linux System Audit Script 🐧

A simple bash script that performs a basic system audit on a Linux machine — collecting information about users, configuration files, system info, and file permissions.

## 🔍 What it does

- 📁 Sets up a working directory (`~/exam_results/audit/`) for all output files
- 👤 Extracts usernames from `/etc/passwd`
- 🐚 Finds users whose default shell is `/bin/bash`
- 🔄 Previews what `/etc/passwd` would look like if `/bin/bash` were replaced with `/usr/bin/zsh` (preview only, does not modify the original file)
- 🖥️ Collects kernel version, architecture, and a summary of `/etc/group`
- 📄 Finds all `.conf` files under `/etc` and the 10 largest files under `/var/log`
- 🔒 Backs up `/etc/hosts`, restricts its permissions to owner-only (`chmod 600`), and records the result
- 🧹 Cleans up intermediate `.txt` files, keeping only `notes.txt` and `hosts_perm.txt`

## 🚀 Usage

```bash
chmod +x system_audit_exam.sh
./system_audit_exam.sh
```

All output files are created under `~/exam_results/audit/`.

## 📦 Sample output

The `audit/` folder in this repository contains a sample run's output (`hosts.bak`, `hosts_perm.txt`, `notes.txt`).
