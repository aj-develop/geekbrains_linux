# 4. Используя grep, проанализировать файл /var/log/syslog, отобрав события на своё усмотрение.

alex@alex-ubuntu:~/test$ grep 'offline' /var/log/syslog
Nov 21 11:33:37 alex-ubuntu whoopsie[727]: [11:33:37] offline
Nov 21 11:58:57 alex-ubuntu whoopsie[727]: [11:58:57] offline
Nov 22 13:53:48 alex-ubuntu whoopsie[727]: [13:53:48] offline
Nov 22 16:26:19 alex-ubuntu whoopsie[727]: [16:26:19] offline
Nov 22 17:02:02 alex-ubuntu whoopsie[727]: [17:02:02] offline