# 1. Подключить репозиторий с nginx любым удобным способом,
# установить nginx и потом удалить nginx, используя утилиту dpkg.
alex@alex-ubuntu:~$ sudo apt install curl gnupg2 ca-certificates lsb-release
alex@alex-ubuntu:~$ echo "deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" \
>     | sudo tee /etc/apt/sources.list.d/nginx.list
deb http://nginx.org/packages/mainline/ubuntu focal nginx
alex@alex-ubuntu:~$ curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
OK
alex@alex-ubuntu:~$ sudo apt-key fingerprint ABF5BD827BD9BF62
pub   rsa2048 2011-08-19 [SC] [expires: 2024-06-14]
      573B FD6B 3D8F BC64 1079  A6AB ABF5 BD82 7BD9 BF62
uid           [ unknown] nginx signing key <signing-key@nginx.com>

alex@alex-ubuntu:~$sudo apt update
alex@alex-ubuntu:~$sudo apt install nginx
alex@alex-ubuntu:~$ nginx -v
nginx version: nginx/1.19.5

###########################################################

alex@alex-ubuntu:~$ sudo dpkg -r nginx
(Reading database ... 167882 files and directories currently installed.)
Removing nginx (1.19.5-1~focal) ...
Processing triggers for man-db (2.9.1-1) ...