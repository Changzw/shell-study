#!/bin/sh 
:<<!
This is my cat
  my cat's name is betty
This is my dog
  my dog's name is frank
This is my fish
  my fish's name is george
This is my goat
  my goat's name is adam
!

test_data='sed-test-data'
:<<!
查找并替换，类似 vim 的 select
!
echo 其中的my字符串替换成Hao Chen’s------------------
sed "s/my/Chang's/g" $test_data
echo 每一行最前面加点东西----------------------------
sed 's/^/#/g' $test_data
sed 's/$/#/g' $test_data
echo

:<<!
顺手介绍一下正则表达式的一些最基本的东西：
^ 	表示一行的开头。如：/^#/ 以#开头的匹配。
$ 	表示一行的结尾。如：/}$/ 以}结尾的匹配。
\< 	表示词首。 如：\<abc 表示以 abc 为首的詞。
\> 	表示词尾。 如：abc\> 表示以 abc 結尾的詞。
. 	表示任何单个字符。
* 	表示某个字符出现了0次或多次。
[ ] 字符集合。 如：[abc] 表示匹配a或b或c，还有 [a-zA-Z] 表示匹配所有的26个字符。如果其中有^表示反，如 [^a] 表示非a的字符
!

echo 替换html 中所有tags----------------------------
html="sed-test-html"
# 如果你这样搞的话，就会有问题
sed 's/<.*>//g' $html
echo 
# 要解决上面的那个问题，就得像下面这样。
# 其中的'[^>]' 指定了除了>的字符重复0次或多次。
sed 's/<[^>]*>//g' $html

echo 替换指定需行的内容----------------------------
sed "3s/my/<your>!/g" $test_data
sed "3,6s/my/<your>!/g" $test_data

echo 只替换每一行的第一个s：------------------------
sed 's/s/S/1' $test_data
echo 只替换每一行的第二个s：------------------------
sed 's/s/S/2' $test_data
echo 替换第一行的第3个以后的s：----------------------
sed 's/s/S/2g' $test_data





