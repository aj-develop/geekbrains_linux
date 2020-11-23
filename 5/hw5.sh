##########
# 1.
#
# Создать файл file1 и наполнить его произвольным содержимым.
alex@alex-ubuntu:~/test$ echo "hello world" > file1
# Скопировать его в file2.
alex@alex-ubuntu:~/test$ cp file1 file2
# Создать символическую ссылку file3 на file1.
alex@alex-ubuntu:~/test$ ln -s file1 file3
# Создать жёсткую ссылку file4 на file1.
alex@alex-ubuntu:~/test$ ln file1 file4
# Посмотреть, какие inode у файлов.
alex@alex-ubuntu:~/test$ ls -ials
total 20
1966105 4 drwxrwxr-x  2 alex alex 4096 Nov 21 20:48 .
1966082 4 drwxr-xr-x 16 alex alex 4096 Nov 21 20:44 ..
1966090 4 -rw-rw-r--  2 alex alex   12 Nov 21 20:45 file1
1966125 4 -rw-rw-r--  1 alex alex   12 Nov 21 20:46 file2
1966126 0 lrwxrwxrwx  1 alex alex    5 Nov 21 20:48 file3 -> file1
1966090 4 -rw-rw-r--  2 alex alex   12 Nov 21 20:45 file4
# Удалить file1.
alex@alex-ubuntu:~/test$ rm file1
# Что стало с остальными созданными файлами?
alex@alex-ubuntu:~/test$ ls -ials
total 16
1966105 4 drwxrwxr-x  2 alex alex 4096 Nov 21 20:50 .
1966082 4 drwxr-xr-x 16 alex alex 4096 Nov 21 20:44 ..
1966125 4 -rw-rw-r--  1 alex alex   12 Nov 21 20:46 file2 //
1966126 0 lrwxrwxrwx  1 alex alex    5 Nov 21 20:48 file3 -> file1
1966090 4 -rw-rw-r--  1 alex alex   12 Nov 21 20:45 file4
# file2 и file4 рабочие. file3 битая ссылка

# Попробовать вывести их на экран.
alex@alex-ubuntu:~/test$ cat file2
hello world
alex@alex-ubuntu:~/test$ cat file4
hello world
alex@alex-ubuntu:~/test$ cat file3
cat: file3: No such file or directory
alex@alex-ubuntu:~/test$

##########
# 2.
# Дать созданным файлам другие, произвольные имена.
alex@alex-ubuntu:~/test$ mv file2 file22
alex@alex-ubuntu:~/test$ mv file4 file44
# Создать новую символическую ссылку.
alex@alex-ubuntu:~/test$ ln -s file22 file5
# Переместить ссылки в другую директорию.
alex@alex-ubuntu:~/test$ mkdir test2
alex@alex-ubuntu:~/test$ mv file5 test2
alex@alex-ubuntu:~/test$ cat test2/file5
cat: test2/file5: No such file or directory
# file5 битая ссылка

##########
# 3.
#
# Создать два произвольных файла.
alex@alex-ubuntu:~/test$ touch file1 file2
alex@alex-ubuntu:~/test$ ls -als | grep file
0 -rw-rw-r--  1 alex alex    0 Nov 22 11:40 file1
0 -rw-rw-r--  1 alex alex    0 Nov 22 11:40 file2
# Первому присвоить права на чтение и запись для владельца и группы, только на чтение — для всех.
alex@alex-ubuntu:~/test$ chmod u=rw,g=rw,o=r file1
# Второму присвоить права на чтение и запись только для владельца.
alex@alex-ubuntu:~/test$ chmod u=rw,g=,o= file2

alex@alex-ubuntu:~/test$ ls -als | grep file
0 -rw-rw-r--  1 alex alex    0 Nov 22 11:40 file1
0 -rw-------  1 alex alex    0 Nov 22 11:40 file2

# Сделать это в численном виде.
alex@alex-ubuntu:~/test$ chmod 000 file*
alex@alex-ubuntu:~/test$ chmod 664 file1
alex@alex-ubuntu:~/test$ chmod 600 file2
alex@alex-ubuntu:~/test$ ls -als | grep file
0 -rw-rw-r--  1 alex alex    0 Nov 22 11:40 file1
0 -rw-------  1 alex alex    0 Nov 22 11:40 file2

##########
# 4.
#
# Создать пользователя, обладающего возможностью выполнять действия от имени суперпользователя.
alex@alex-ubuntu:~$ sudo adduser superuser1
alex@alex-ubuntu:~$ sudo usermod -aG sudo superuser1
