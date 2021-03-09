#!/bin/bash


# ==============================================
# git operation
# Author: Huailiang.Peng
# ==============================================

PACK_PATH=/Library/WebServer/Documents/pac/

traverse_dir()
{
    filepath=$1
    ext=$2
    for file in `ls -a $filepath`
    do
        if [ -d ${filepath}/$file ]
        then
            if [[ $file != '.' && $file != '..' ]]
            then
                #递归
                traverse_dir ${filepath}/$file ${ext}
            fi
        else
            #调用查找指定后缀文件
            check_suffix ${filepath} $file ${ext}
        fi
    done
}
 
 
##获取后缀为txt或ini的文件
check_suffix()
{
    file=${2}
    ext=${3}
    if [ "${file##*.}"x = ${ext}x ] || [ "${file##*.}"x = "ini"x ];then
        echo "http://10.253.48.151/pac/"${file}
    fi    
}

echo -e "\n当前磁盘信息:"

df -hl

echo -e "\n当前进程信息:"

launchctl list | grep com. 


echo -e "\nAndroid包列表:"

traverse_dir ${PACK_PATH} "apk"


echo -e "\niOS包列表:"

traverse_dir ${PACK_PATH} "ipa"