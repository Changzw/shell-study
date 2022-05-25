#!/bin/sh

# read 命令可以从stdio 中读取数据，可以是键盘，管道 | 文件 ……
# read a b c 
# echo $a $b $c

# expr 命令，对整数型数据做算术运算
# expr 3 + 5 
# expr 4 \* 5 
expr 4 / 2 
echo $?

# test 变量测试语句，格式 test [测试格式]
# 测试范围：整数，文件，字符串
# 测试字符串变量
# test $str1 == $str2 
# test $str1 != $str2 
# test $str2 		不空
# test -n $str2 	空 
# test -z $str2 	空 

# 测试整数
# test $int1 -eq $int2
# test $int1 -ge $int2
# test $int1 -gt $int2 (great than)
# test $int1 -le $int2
# test $int1 -lt $int2 (less than)
# test $int1 -ne $int2 

# 可以省略 test 用 [ 表达式 ] [ $str1 == $str2 ]

# 测试文件
# test -d $file 
# test -f $file 
# test -x $file 
# test -r $file 
# test -b $file  block 文件
# test -w $file 
# test -c $file  设备文件
# test -e $file 	是否存在
# test -s $file  测试大小，是否为空

# [ -x $file ] 判断是否可执行

# 连续执行命令 &&，如果有一个命令报错，后面的命令就不会执行

# echo 'input read file'
# read file_name
# if [ -x $file_name ]
# then 
# echo exeable
# elif [ -f $file_name ]
# echo isfile  
# then
# echo xxxx
# fi 

var1="23qsdf"
var2=";lkjk"
if [ $var1 == $var2 ]; then 
echo "equal"
elif [ $var1 != $var2 ]; then 
echo "inequal"
fi

# -o 或 -> || or 
# -a 与 -> && and
filename=course-ali2.sh 
if [ -x $filename -o -f $filename ]; then 
echo $filename
fi