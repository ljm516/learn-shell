#!/bin/sh

# if [ $# -eq 0 ]
  # then
  #   echo "No environment selected. e.g, staging/dev/dev2/dev3"
  #   exit 1
# fi

# ENV=$1
SOURCE_HOST='host'
SOURCE_USER='usename'
SOURCE_PASSWD='password'
TARGET_HOST=127.0.0.1
TARGET_USER=root
TARGET_PASSWD=''


declare -a databases=(......)

for db in "${databases[@]}"
do
    DUMP_FILE=${db}_dump.sql
    SOURCE_DB=${db}_production
    TARGET_DB=${db}_localhost


    # Dump data
    printf "> Dumping $db to $DUMP_FILE ... "
    mysqldump --host=$SOURCE_HOST --user=$SOURCE_USER --password=$SOURCE_PASSWD --single-transaction --set-gtid-purged=OFF $SOURCE_DB > $DUMP_FILE
    printf "Dump Finished\n"

    #Restore from dumps
    printf "> Restore $db from $DUMP_FILE ... "
    mysql --host=$TARGET_HOST --user=$TARGET_USER --password=$TARGET_PASSWD $TARGET_DB < $DUMP_FILE
    printf "Restore Finished\n"
done

