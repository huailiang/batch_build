#!/bin/bash


# ==============================================
# 用来生成二维码图片
# arg1: 包名
# ==============================================

#如果传过来的参数不对 向上抛出异常
if [ $# != 1 ] ; then 
echo "参数不对" 
exit 1; 
fi 

EXT=`echo ${1: -3}`

plat=3

name="win_"${uid}"_"${branch}

if [ ${EXT} = "apk" ];then
	name="android_"${uid}"_"${branch}
	plat=1
elif [[ ${EXT} = "ipa" ]]; then
	name="ios_"${uid}"_"${branch}
	plat=2
fi

cd /Library/WebServer/Documents/

/usr/bin/php generateQR.php ${name} ${plat}

echo "二维码地址：http://10.253.48.98/qrimg/"${name}".png"
