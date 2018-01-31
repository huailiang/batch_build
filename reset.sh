# ============================================
#This tool is for reset inactive with php
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.01.24
# ==============================================
#!/bin/sh

PROJECT_RES=/Users/dn/Documents/patch_res

PROJECT_SRC=/Users/dn/Documents/patch_src

PROJECT_Android=/Users/dn/Documents/patch_android/XProject

PROJECT_Ios=/Users/dn/Documents/patch_android/XProject

echo "stat reset res option"

cd ${PROJECT_RES}

git add .

git reset --hard 

echo "res current status:"

git log -1

echo "git cleanup finish\n\n"

############################################

echo "start reset src option"

cd ${PROJECT_SRC}

git add .

git reset --hard 

git status -s .

echo "src current status"

git log -1

echo "clean src finish\n\n"


################################################

echo "start reset android env"

cd ${PROJECT_Android}

git add .

git reset --hard 

git status  -s .

echo "android env current status:"

git log -1

echo "reset android env finish\n\n"


##############################################

echo 'start reset ios env'

cd ${PROJECT_Ios}

git add .

git reset --hard 

git status -s .

echo "ios evn current status:"

git log -1

echo "reset ios env finish"

echo "\n\n*************************************"
