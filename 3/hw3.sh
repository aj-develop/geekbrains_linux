# 1) создать нового пользователя, дать ему возможность выполнять действия от имени суперпользователя
alex@alex-ubuntu:~$ sudo adduser superpuperuser1
[sudo] Passwort für alex:
Benutzer »superpuperuser1« wird hinzugefügt …
Neue Gruppe »superpuperuser1« (1001) wird hinzugefügt …
Neuer Benutzer »superpuperuser1« (1001) mit Gruppe »superpuperuser1« wird hinzugefügt …
Persönliche Ordner »/home/superpuperuser1« wird erstellt …
Dateien werden von »/etc/skel« kopiert …
Bitte ein neues Passwort eingeben:
Bitte das neue Passwort erneut eingeben:
passwd: Passwort erfolgreich geändert
Benutzerinformationen für superpuperuser1 werden geändert.
Geben Sie einen neuen Wert an oder drücken Sie ENTER für den Standardwert
	Vollständiger Name []:
	Zimmernummer []:
	Telefon geschäftlich []:
	Telefon privat []:
	Sonstiges []:
Ist diese Information richtig? [J/N] J
alex@alex-ubuntu:~$

alex@alex-ubuntu:~$ sudo usermod -aG sudo superpuperuser1

# 2) создать еще одного пользователя, но не давать ему выполнять действия от имени суперпользователя
alex@alex-ubuntu:~$ sudo adduser superpuperuser2
Benutzer »superpuperuser2« wird hinzugefügt …
Neue Gruppe »superpuperuser2« (1002) wird hinzugefügt …
Neuer Benutzer »superpuperuser2« (1002) mit Gruppe »superpuperuser2« wird hinzugefügt …
Persönliche Ordner »/home/superpuperuser2« wird erstellt …
Dateien werden von »/etc/skel« kopiert …
Bitte ein neues Passwort eingeben:
Bitte das neue Passwort erneut eingeben:
passwd: Passwort erfolgreich geändert
Benutzerinformationen für superpuperuser2 werden geändert.
Geben Sie einen neuen Wert an oder drücken Sie ENTER für den Standardwert
	Vollständiger Name []:
	Zimmernummer []:
	Telefon geschäftlich []:
	Telefon privat []:
	Sonstiges []:
Ist diese Information richtig? [J/N] J
alex@alex-ubuntu:~$

# 3) создать группу, пользователи которой будут иметь возможность монтировать и размонтировать с судо без ввода пароля
# (даже если пользователь не входит в группу sud9)
alex@alex-ubuntu:~$ sudo groupadd u-mount-group

alex@alex-ubuntu:~$ sudo visudo
%u-mount-group  ALL=NOPASSWD:/usr/bin/mount, /usr/bin/umount

# 4) добавить обоих пользователей в эту группу
alex@alex-ubuntu:~$ sudo usermod -aG u-mount-group superpuperuser1
alex@alex-ubuntu:~$ sudo usermod -aG u-mount-group superpuperuser2


# Проверяем. Работает.
superpuperuser2@alex-ubuntu:/home/alex$ sudo mount /dev/cdrom /cdrom
mount: /cdrom: WARNUNG: das Gerät ist schreibgeschützt und wird daher im Nur-Lese-Modus eingehängt.

superpuperuser2@alex-ubuntu:/home/alex$ ls -als /cdrom
insgesamt 46832
    3 dr-xr-xr-x  5 root root     2408 Okt 15 16:48 .
    4 drwxr-xr-x 20 root root     4096 Nov  7 16:48 ..
    1 -r--r--r--  1 root root      763 Feb 20  2020 AUTORUN.INF
    7 -r-xr-xr-x  1 root root     6384 Okt 15 16:42 autorun.sh
    1 dr-xr-xr-x  2 root root      792 Okt 15 16:48 cert
    2 dr-xr-xr-x  2 root root     1824 Okt 15 16:48 NT3x
    3 dr-xr-xr-x  2 root root     2652 Okt 15 16:48 OS2
    5 -r-xr-xr-x  1 root root     4821 Okt 15 16:42 runasroot.sh
    1 -r--r--r--  1 root root      547 Okt 15 16:48 TRANS.TBL
 3741 -r--r--r--  1 root root  3830063 Okt 15 16:41 VBoxDarwinAdditions.pkg
    4 -r-xr-xr-x  1 root root     3949 Okt 15 16:41 VBoxDarwinAdditionsUninstall.tool
 7240 -r-xr-xr-x  1 root root  7413172 Okt 15 16:42 VBoxLinuxAdditions.run
 9182 -r--r--r--  1 root root  9401856 Okt 15 17:41 VBoxSolarisAdditions.pkg
16554 -r-xr-xr-x  1 root root 16950792 Okt 15 16:45 VBoxWindowsAdditions-amd64.exe
  265 -r-xr-xr-x  1 root root   270616 Okt 15 16:42 VBoxWindowsAdditions.exe
 9822 -r-xr-xr-x  1 root root 10057608 Okt 15 16:43 VBoxWindowsAdditions-x86.exe

superpuperuser2@alex-ubuntu:/home/alex$ sudo umount /cdrom
superpuperuser2@alex-ubuntu:/home/alex$ ls -als /cdrom
insgesamt 8
4 drwxrwxr-x  2 root root 4096 Nov  7 16:48 .
4 drwxr-xr-x 20 root root 4096 Nov  7 16:48 ..