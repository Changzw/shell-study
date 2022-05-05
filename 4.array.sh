#!/bin/bash
:<<!
array_name=(value1 value2 ... valuen)
https://www.runoob.com/linux/linux-shell-array.html
!

names=(1 2 3 4 5)
echo "第一个元素：$names"
echo "所有元素：${names[*]}"
echo "2号位：${names[2]}"
echo "个数：${#names[*]}"

total=0
for ((i=0;i<${#names[*]};++i)); do 
total=$total+${names[i]}
done
echo $total

:<<!
注释内容...
注释内容...
注释内容...
!