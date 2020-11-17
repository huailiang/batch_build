#!/bin/bash

# ==============================================
# 清理磁盘上包体、日志等
# Author: Huailiang.Peng
# ----------------------------------------------
# ==============================================


echo "delete file before: "${day}

PROJPATH=/Library/WebServer/Documents

cd ${PROJPATH}


function clean()
{
	echo "开始清理"${1}

	cd ${PROJPATH}/${1}

	# pwd

	find . -mtime +${day} | xargs ls -al

	find . -mtime +${day} | xargs rm -rf

	echo -e "清理"${1}"完毕\n"
}

clean ecs

clean pac

clean buildlog

clean qrimg

clean symbol

echo "目前磁盘信息："

df -hl