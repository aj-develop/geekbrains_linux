# Сначала установим пакеты, необходимые для работы apt по протоколу HTTPS:
alex@alex-ubuntu:~$ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
[sudo] password for alex:
Reading package lists... Done
Building dependency tree
Reading state information... Done
ca-certificates is already the newest version (20201027ubuntu0.20.04.1).
curl is already the newest version (7.68.0-1ubuntu2.2).
The following package was automatically installed and is no longer required:
  libfprint-2-tod1
Use 'sudo apt autoremove' to remove it.
The following NEW packages will be installed
  apt-transport-https gnupg-agent
The following packages will be upgraded:
  python3-software-properties software-properties-common software-properties-gtk
3 to upgrade, 2 to newly install, 0 to remove and 48 not to upgrade.
Need to get 107 kB of archives.
After this operation, 206 kB of additional disk space will be used.
Get:1 http://de.archive.ubuntu.com/ubuntu focal-updates/universe amd64 apt-transport-https all 2.0.2ubuntu0.1 [1,708 B]
Get:2 http://de.archive.ubuntu.com/ubuntu focal/universe amd64 gnupg-agent all 2.2.19-3ubuntu2 [5,236 B]
Get:3 http://de.archive.ubuntu.com/ubuntu focal-updates/main amd64 software-properties-common all 0.98.9.3 [10.6 kB]
Get:4 http://de.archive.ubuntu.com/ubuntu focal-updates/main amd64 software-properties-gtk all 0.98.9.3 [64.0 kB]
Get:5 http://de.archive.ubuntu.com/ubuntu focal-updates/main amd64 python3-software-properties all 0.98.9.3 [25.3 kB]
Fetched 107 kB in 0s (384 kB/s)
Selecting previously unselected package apt-transport-https.
(Reading database ... 167862 files and directories currently installed.)
Preparing to unpack .../apt-transport-https_2.0.2ubuntu0.1_all.deb ...
Unpacking apt-transport-https (2.0.2ubuntu0.1) ...
Selecting previously unselected package gnupg-agent.
Preparing to unpack .../gnupg-agent_2.2.19-3ubuntu2_all.deb ...
Unpacking gnupg-agent (2.2.19-3ubuntu2) ...
Preparing to unpack .../software-properties-common_0.98.9.3_all.deb ...
Unpacking software-properties-common (0.98.9.3) over (0.98.9.2) ...
Preparing to unpack .../software-properties-gtk_0.98.9.3_all.deb ...
Unpacking software-properties-gtk (0.98.9.3) over (0.98.9.2) ...
Preparing to unpack .../python3-software-properties_0.98.9.3_all.deb ...
Unpacking python3-software-properties (0.98.9.3) over (0.98.9.2) ...
Setting up apt-transport-https (2.0.2ubuntu0.1) ...
Setting up python3-software-properties (0.98.9.3) ...
Setting up gnupg-agent (2.2.19-3ubuntu2) ...
Setting up software-properties-common (0.98.9.3) ...
Setting up software-properties-gtk (0.98.9.3) ...
Processing triggers for dbus (1.12.16-2ubuntu2.1) ...
Processing triggers for shared-mime-info (1.15-1) ...
Processing triggers for desktop-file-utils (0.24-1ubuntu3) ...
Processing triggers for mime-support (3.64ubuntu1) ...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu1) ...
Processing triggers for libglib2.0-0:amd64 (2.64.3-1~ubuntu20.04.1) ...
Processing triggers for man-db (2.9.1-1) ...

# Добавляем ключ репозитория
alex@alex-ubuntu:~$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
OK

# Подключаем репозиторий
alex@alex-ubuntu:~$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
Hit:1 http://de.archive.ubuntu.com/ubuntu focal InRelease
Get:2 http://de.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:3 http://de.archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
Get:4 http://de.archive.ubuntu.com/ubuntu focal-updates/main i386 Packages [388 kB]
Get:5 http://nginx.org/packages/mainline/ubuntu focal InRelease [2,852 B]
Get:6 http://de.archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [683 kB]
Get:7 http://de.archive.ubuntu.com/ubuntu focal-updates/main Translation-en [173 kB]
Get:8 http://de.archive.ubuntu.com/ubuntu focal-updates/main amd64 DEP-11 Metadata [236 kB]
Get:9 http://de.archive.ubuntu.com/ubuntu focal-updates/main amd64 c-n-f Metadata [11.3 kB]
Get:10 http://de.archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [96.3 kB]
Get:11 http://de.archive.ubuntu.com/ubuntu focal-updates/restricted Translation-en [14.9 kB]
Get:12 http://de.archive.ubuntu.com/ubuntu focal-updates/universe i386 Packages [522 kB]
Get:13 https://download.docker.com/linux/ubuntu focal InRelease [36.2 kB]
Get:14 http://de.archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [701 kB]
Get:15 http://de.archive.ubuntu.com/ubuntu focal-updates/universe Translation-en [138 kB]
Get:16 http://de.archive.ubuntu.com/ubuntu focal-updates/universe amd64 DEP-11 Metadata [205 kB]
Get:17 http://security.ubuntu.com/ubuntu focal-security InRelease [109 kB]
Get:18 http://de.archive.ubuntu.com/ubuntu focal-updates/universe DEP-11 48x48 Icons [109 kB]
Get:19 http://de.archive.ubuntu.com/ubuntu focal-updates/universe amd64 c-n-f Metadata [13.4 kB]
Get:20 http://de.archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [20.0 kB]
Get:21 http://de.archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 DEP-11 Metadata [2,468 B]
Get:22 http://de.archive.ubuntu.com/ubuntu focal-backports/universe amd64 DEP-11 Metadata [1,768 B]
Get:23 http://nginx.org/packages/mainline/ubuntu focal/nginx amd64 Packages [15.8 kB]
Get:24 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages [5,156 B]
Get:25 http://security.ubuntu.com/ubuntu focal-security/main i386 Packages [162 kB]
Get:26 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [376 kB]
Get:27 http://security.ubuntu.com/ubuntu focal-security/main Translation-en [87.2 kB]
Get:28 http://security.ubuntu.com/ubuntu focal-security/main amd64 DEP-11 Metadata [24.3 kB]
Get:29 http://security.ubuntu.com/ubuntu focal-security/main DEP-11 48x48 Icons [11.0 kB]
Get:30 http://security.ubuntu.com/ubuntu focal-security/main amd64 c-n-f Metadata [5,584 B]
Get:31 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [521 kB]
Get:32 http://security.ubuntu.com/ubuntu focal-security/universe i386 Packages [413 kB]
Get:33 http://security.ubuntu.com/ubuntu focal-security/universe Translation-en [68.6 kB]
Get:34 http://security.ubuntu.com/ubuntu focal-security/universe amd64 DEP-11 Metadata [56.6 kB]
Get:35 http://security.ubuntu.com/ubuntu focal-security/universe DEP-11 48x48 Icons [23.0 kB]
Get:36 http://security.ubuntu.com/ubuntu focal-security/universe amd64 c-n-f Metadata [9,364 B]
Get:37 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [1,256 B]
Fetched 5,457 kB in 2s (2,433 kB/s)
Reading package lists... Done
N: Skipping acquisition of configured file 'nginx/binary-i386/Packages'...

# Обновляем список пакетов
alex@alex-ubuntu:~$ sudo apt update
Hit:1 http://de.archive.ubuntu.com/ubuntu focal InRelease
Hit:2 http://de.archive.ubuntu.com/ubuntu focal-updates InRelease
Hit:3 http://de.archive.ubuntu.com/ubuntu focal-backports InRelease
Hit:4 http://nginx.org/packages/mainline/ubuntu focal InRelease
Get:5 http://security.ubuntu.com/ubuntu focal-security InRelease [109 kB]
Hit:6 https://download.docker.com/linux/ubuntu focal InRelease
Fetched 109 kB in 1s (178 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
83 packages can be upgraded. Run 'apt list --upgradable' to see them.
N: Skipping acquisition of configured file 'nginx/binary-i386/Packages',
as repository 'http://nginx.org/packages/mainline/ubuntu focal InRelease'...

#  устанавливаем пакет docker-ce
alex@alex-ubuntu:~$ sudo apt install docker-ce -y
...

# устанавливаем пакет docker-compose
alex@alex-ubuntu:~$ sudo apt install -y docker docker-compose
...

# test
alex@alex-ubuntu:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete
Digest: sha256:1a523af650137b8accdaed439c17d684df61ee4d74feac151b5b337bd29e7eec
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

