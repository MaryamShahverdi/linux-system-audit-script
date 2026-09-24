#!/bin/bash

mkdir -p ~/exam_results/audit
echo "# Notes file" > ~/exam_results/audit/notes.txt

echo "# Current working directory" > ~/exam_results/audit/cwd.txt
pwd >> ~/exam_results/audit/cwd.txt

echo "# List of usernames" > ~/exam_results/audit/users.txt
cut -d: -f1 /etc/passwd >> ~/exam_results/audit/users.txt

echo "# Users with /bin/bash shell" > ~/exam_results/audit/bash_users.txt
grep '/bin/bash$' /etc/passwd >> ~/exam_results/audit/bash_users.txt

echo "# Preview of passwd with /usr/bin/zsh (first 5 lines)" > ~/exam_results/audit/shell_preview.txt
sed 's|/bin/bash|/usr/bin/zsh|' /etc/passwd | head -5 >> ~/exam_results/audit/shell_preview.txt

echo "# Kernel and architecture info" > ~/exam_results/audit/sysinfo.txt
uname -sr >> ~/exam_results/audit/sysinfo.txt
arch >> ~/exam_results/audit/sysinfo.txt

echo "# Group summary (first 3, last 2 lines)" > ~/exam_results/audit/group_summary.txt
head -3 /etc/group >> ~/exam_results/audit/group_summary.txt
tail -2 /etc/group >> ~/exam_results/audit/group_summary.txt

echo "# List of .conf files in /etc" > ~/exam_results/audit/conf_files.txt
find /etc -name "*.conf" 2>/dev/null >> ~/exam_results/audit/conf_files.txt

echo "# Top 10 largest files in /var/log" > ~/exam_results/audit/top_logs.txt
find /var/log -type f 2>/dev/null -exec du -h {} + 2>/dev/null | sort -rh | head -10 >> ~/exam_results/audit/top_logs.txt

cp /etc/hosts ~/exam_results/audit/hosts.bak
chmod 600 ~/exam_results/audit/hosts.bak

echo "# Permissions of hosts.bak" > ~/exam_results/audit/hosts_perm.txt
ls -l ~/exam_results/audit/hosts.bak >> ~/exam_results/audit/hosts_perm.txt

find ~/exam_results/audit -maxdepth 1 -name "*.txt" ! -name "hosts_perm.txt" ! -name "notes.txt" -delete
