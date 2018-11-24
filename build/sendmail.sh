#!/bin/bash


# ==============================================
# 用来发送邮件
# ----------------------------------------------
# arg1: 下载链接
# ==============================================


if [ $# != 1 ] ; then 
echo "mail -- 参数个数不对" 
exit 1; 
fi 

root=/Users/penghuailiang/Documents/shells

if [ -n "${email}" ]; then 

cd ${root}

cp mailformat mailformat2

sed -i "" "s/packname/"${1}"/g" mailformat2

cat mailformat2 | mail -s "Jenkins通知" ${email}

rm -rf mailformat2

echo "邮件已发送至:"${email}

fi