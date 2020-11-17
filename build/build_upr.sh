# ==============================================
# Unity官方UPR资源性能分析工具
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2020.11.09
# ==============================================
#!/bin/sh


#游戏工程目录#
PROJPATH=/Users/penghuailiang/Documents/projects/op_ios/OPProject

PLUGINPATH=/Users/penghuailiang/Documents/kms

PROJECTID=0ce7ba3f-c402-4527-8f35-827a0412a399


echo "开始资源检测"

cd ${PLUGINPATH}

# ./unity-asset-checker/assetcheck --project=${PROJPATH} --projectId=${PROJECTID}

# echo "代码分析"

# ./unity-asset-checker/assetcheck code-analyze --project=${PROJPATH} --projectId=${PROJECTID}

echo "AssetBundle冗余分析"

./unity-asset-checker/assetcheck abcheck --project=${PROJPATH}/Assets/StreamingAssets --projectId=${PROJECTID}
