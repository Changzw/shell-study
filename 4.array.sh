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
数组个数 ${!lprojs[*]}
!
lprojs=('ar' 'zh-Hans' 'en')
requestLangs=('阿拉' '中文' '阿拉') #英文的strings文件也填入阿语翻译

echo ${lprojs[*]}
echo ${!lprojs[*]} # 所有index 数组

for i in "${!lprojs[*]}";
do
	echo $i
	echo ${lprojs[i]}
	echo ${requestLangs[i]}
done

:<<!
注释内容...
注释内容...
注释内容...
!