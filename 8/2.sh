# Запустить контейнер с Ubuntu.
alex@alex-ubuntu:~$ sudo docker run ubuntu
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
da7391352a9b: Pull complete
14428a6d4bcd: Pull complete
2c2d948710f2: Pull complete
Digest: sha256:c95a8e48bf88e9849f3e0f723d9f49fa12c5a00cfc6e60d2bc99d87555295e4c
Status: Downloaded newer image for ubuntu:latest

alex@alex-ubuntu:~$ sudo docker run --name my_ubuntu_container -it ubuntu bash
root@27779ddae995:/#