# 1. Написать скрипт, который удаляет из текстового файла пустые строки
# и заменяет маленькие символы на большие.
# Воспользуйтесь tr или SED.

# ----------

#!/usr/bin/bash
sed -i '/^$/d' $1
sed -e 's/\(.*\)/\U\1/' $1

# ----------

# test
alex@alex-ubuntu:~/test$ cat file.txt
Lorem ipsum dolor sit eamet,

consetetur

sadipscing elitr

alex@alex-ubuntu:~/test$ ./1.sh file.txt
LOREM IPSUM DOLOR SIT EAMET,
CONSETETUR
SADIPSCING ELITR