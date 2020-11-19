# 1. Потоки ввода/вывода.
# Создать файл, используя команду echo.
# Используя команду cat, прочитать содержимое каталога etc, ошибки перенаправить в отдельный файл.

alex@alex-ubuntu:~$ echo "Hello world!" > hello.txt
alex@alex-ubuntu:~$ cat hello.txt
Hello world!

alex@alex-ubuntu:~$ cat /etc/* 2> cat_etc_error.txt

# 2. Конвейер (pipeline).
# Использовать команду cut на вывод длинного списка каталога, чтобы отобразить только права доступа к файлам.
# Затем отправить в конвейере этот вывод на sort и uniq, чтобы отфильтровать все повторяющиеся строки.

alex@alex-ubuntu:~$ ls -als /etc | cut -d ' ' -f3 | sort | uniq -c | tail --lines=+3
      1 drwxr-s---
    127 drwxr-xr-x
      6 lrwxrwxrwx
      1 -r--r-----
      1 -r--r--r--
      1 -rw-------
      5 -rw-r-----
     71 -rw-r--r--
      3 -rw-rw-r--

# 3. Управление процессами.
# Изменить конфигурационный файл службы SSH: /etc/ssh/sshd_config, отключив аутентификацию по паролю PasswordAuthentication no.
# Выполните рестарт службы systemctl restart sshd (service sshd restart), верните аутентификацию по паролю,
# выполните reload службы systemctl reload sshd (services sshd reload).
# В чём различие между действиями restart и reload?
# Создайте файл при помощи команды cat > file_name, напишите текст и завершите комбинацией ctrl+d.
# Какой сигнал передадим процессу?

Restart останвливает службу и заново запускает.
Reload даёт команду службе перечитать файлы конфигурации без остановки работы.

Нажатие Ctrl + D говорит терминалу, что надо зарегистрировать так называемый EOF (end of file – конец файла),
то есть поток ввода окончен. Bash интерпретирует это как желание выйти из программы.


# 4. Сигналы процессам. Запустите mc. Используя ps, найдите PID процесса, завершите процесс, передав ему сигнал 9.

# 1. session
alex@alex-ubuntu:~$ mc

# 2. session
alex@alex-ubuntu:~$ ps ax | grep mc
      7 ?        I      0:00 [kworker/0:1-memcg_kmem_cache]
   2132 pts/0    S+     0:00 mc
   2142 pts/1    S+     0:00 grep --color=auto mc
alex@alex-ubuntu:~$ kill -9 2132

# 1. session
alex@alex-ubuntu:~$ Killed