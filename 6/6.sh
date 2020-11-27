#6. Написать скрипт, делающий архивную копию каталога etc, и прописать задание в crontab.

# скрипт
#!/bin/bash

SOURCE_DIRECTORY="/etc/"
BACKUP_DIRECTORY="/home/alex/backup/"
LOG_FILE="/home/alex/backup/backup.log"

if [[ ! -d $BACKUP_DIRECTORY ]]; then
  echo "`date` Не найден каталог для бэкапа. Создание." >> $LOG_FILE
  mkdir -p $BACKUP_DIRECTORY
fi

tar -cvzf ${BACKUP_DIRECTORY}`date "+%Y%m%d_%s"`.tar.gz $SOURCE_DIRECTORY
echo $?
echo "`date` Создание резервной копии $SOURCE_DIRECTORY завершено." >> $LOG_FILE

# crontab
* * * * * /home/alex/backup/backup.sh > /dev/null

# test
alex@alex-ubuntu:~/backup$ tail -f backup.log
Fr 27. Nov 10:38:01 CET 2020 Создание резервной копии /etc/ завершено.
Fr 27. Nov 10:39:02 CET 2020 Создание резервной копии /etc/ завершено.