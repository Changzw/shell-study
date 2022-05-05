#!/bin/bash

# 显示换行
echo -e "OK! \n" # -e 开启转义
echo "It is a test"

# 显示不换行
echo -e "OK! \c" # -e 开启转义 \c 不换行
echo "It is a test"

# 显示命令执行结果
echo `date`

echo input params, enter finish
read name 
echo "$name It is a test"
