#!/bin/sh

# 将命令值赋值给一个变量
pushd exercise
a=`date`
b=$(ls -l)
echo $a 
echo $b
popd

# 列出所有变量 set 
# set 
# 删除变量 unset

# 单引号，双引号的区别
# 单引号把引号中的内容直接赋值，不会看内部其他引用
# eg
name="hello boy"
name="say $name"
echo $name
name='say $name'
echo $name
# say hello boy
# say $name

#删除变量 unset

# 位置变量，特殊变量
# shell 解释执行用户命令时，将命令行的第一个字作为“命令名”，而其他字作为参数，由于位置固定，所以称为位置参数
ls -l 

# 特殊变量
# 有些变量在开始执行shell 脚本的时候就已经配置好了，且不能被修改
# $*: 这个程序的所有参数
# $#: 这个程序的参数的个数
# $$: 程序的 pid
# $!: 上一个后台程序指令的 pid
# $?: 上一个指令的返回值

echo "$* all params"
echo "$# all params count"

pushd exercise
touch ./course-ali2.sh 
echo "touch ./course-ali2 pid: $$"

touch ./course-ali3.sh &
echo "touch ./course-ali3 pid: $!"
popd
