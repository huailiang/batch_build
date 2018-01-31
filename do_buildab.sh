# ============================================
#This tool is for reset inactive with php
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.01.24
# ==============================================
#!/bin/sh

##############################################

# -p 后面跟的是密码，各机器可能不一样，要修改
security unlock-keychain -p 123u123u ~/Library/Keychains/login.keychain

security set-keychain-setting -t 10800 -l ~/Library/Keychains/login.keychain

sudo sh buildab.sh >log.txt