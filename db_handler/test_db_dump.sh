#!/bin/sh

# if [ $# -eq 0 ]
  # then
  #   echo "No environment selected. e.g, staging/dev/dev2/dev3"
  #   exit 1
# fi

# ENV=$1
SOURCE_HOST=rm-2zeelpc79uk360qhk.mysql.rds.aliyuncs.com
SOURCE_USER=prd_read_account
SOURCE_PASSWD=iRoqcCwhT6v8DC
TARGET_HOST=127.0.0.1
TARGET_USER=root
TARGET_PASSWD=''


declare -a databases=(civilization dagon hdfragment hibernation kangfubao mentalseal nsk oldyolar owl singer solar sophon yolar)

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

python /Users/jiangmingli/youhujia/wk/magic-era/yolar_wechat_profile/recover_open_id.py

