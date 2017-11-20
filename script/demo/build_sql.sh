 #!/bin/sh

#
CODE_LEVEL=1
HAS_CHILD=0
PARENT_ID=null
SHORT_NAME=null
SPELLING=null
ORG_LEVEL=1
STATUS=0
DATE_TO=null
CREATOR=0
WHO_MODIFIED=0
REMARK=null
ROW_ID='AAAWziAAFAAAAFUAAA'
STATUS_TIME=`date "+%Y-%m-%d %H:%M"`
DATE_FROM=`date "+%Y-%m-%d"`
TIME_CREATED=`date "+%Y-%m-%d %H:%M"`
TIME_MODIFIED=`date "+%Y-%m-%d %H:%M"`
CODE_ID=1
SEQUENCE=1
INIT='/00'

declare -a companyList=(北京财益通投资有限公司 北京常春藤资产管理有限公司 北京大成元方信息科技有限公司 北京大众联合投资管理有限公司 北京大众联合投资管理有限公司大连分公司)

for company in "${companyList[@]}"
	
do
	TREE_CODE=${INIT}${CODE_ID}
	O_ID=$(cat /dev/urandom | head -1 | md5sum | head -c 16)
	echo "insert into table values ('${O_ID}', ${CODE_ID}, '${company}', ${CODE_LEVEL}, ${PARENT_ID}, ${HAS_CHILD}, ${SEQUENCE}, ${SHORT_NAME}, ${SPELLING}, '${TREE_CODE}', ${ORG_LEVEL}, ${STATUS}, '${STATUS_TIME}', '${DATE_FROM}', ${DATE_TO}, ${CREATOR}, '${TIME_CREATED}', ${WHO_MODIFIED}, '${TIME_MODIFIED}', ${REMARK}, '${ROW_ID}')"
	CODE_ID=`expr $CODE_ID + 1`
    SEQUENCE=`expr $SEQUENCE + 1`
done
