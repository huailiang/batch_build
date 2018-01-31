# ============================================
#This tool is for test inactive with php
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.01.23
# ==============================================
#!/bin/sh


UNITY_PATH=/Applications/Unity/Unity5.app/Contents/MacOS/Unity

PROJECT_RES=/Users/dn/Documents/patch_res

echo "this is shell test"


cd ${PROJECT_RES}

git pull

git log -1

# for ((i=1; i<=2; i++))
# do
#     echo "hello with "${i}
# done


# echo "hello world!">/Library/WebServer/Documents/dn/Build.txt

# cd /Library/WebServer/Documents/dn/

# ls -al


$UNITY_PATH -quit -batchmode -projectPath ${PROJECT_RES}"/XProject" -logFile /tmp/dn_patch.log -executeMethod XBundlePresent.TestGit

echo "finish"

