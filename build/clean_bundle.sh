#!/bin/bash


# ==============================================
# clean bundle 
# Author: Huailiang.Peng
# ----------------------------------------------
# 清掉之后， build bundle 不再基于增量, 打包时间会变长
# ==============================================

if [ $# != 1 ] ; then 
echo "clean bundle.sh -- 参数个数不对" 
exit 1; 
fi 

# if [ ${clean} = "true" ]; then
	cd ${1}/Assets/StreamingAssets/
	rm -rf Bundles/
	echo "清理bundle缓存完毕"
	cd ${1}
# fi
