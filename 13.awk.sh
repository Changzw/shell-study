#!/bin/sh
# https://coolshell.cn/articles/9070.html
:<<!
之所以叫AWK是因为其取了三位创始人 Alfred Aho，Peter Weinberger, 和 Brian Kernighan 的Family Name的首字符
!

:<<!
Proto Recv-Q Send-Q Local-Address          Foreign-Address             State
tcp        0      0 0.0.0.0:3306           0.0.0.0:*                   LISTEN
tcp        0      0 0.0.0.0:80             0.0.0.0:*                   LISTEN
tcp        0      0 127.0.0.1:9000         0.0.0.0:*                   LISTEN
tcp        0      0 coolshell.cn:80        124.205.5.146:18245         TIME_WAIT
tcp        0      0 coolshell.cn:80        61.140.101.185:37538        FIN_WAIT2
tcp        0      0 coolshell.cn:80        110.194.134.189:1032        ESTABLISHED
tcp        0      0 coolshell.cn:80        123.169.124.111:49809       ESTABLISHED
tcp        0      0 coolshell.cn:80        116.234.127.77:11502        FIN_WAIT2
tcp        0      0 coolshell.cn:80        123.169.124.111:49829       ESTABLISHED
tcp        0      0 coolshell.cn:80        183.60.215.36:36970         TIME_WAIT
tcp        0   4166 coolshell.cn:80        61.148.242.38:30901         ESTABLISHED
tcp        0      1 coolshell.cn:80        124.152.181.209:26825       FIN_WAIT1
tcp        0      0 coolshell.cn:80        110.194.134.189:4796        ESTABLISHED
tcp        0      0 coolshell.cn:80        183.60.212.163:51082        TIME_WAIT
tcp        0      1 coolshell.cn:80        208.115.113.92:50601        LAST_ACK
tcp        0      0 coolshell.cn:80        123.169.124.111:49840       ESTABLISHED
tcp        0      0 coolshell.cn:80        117.136.20.85:50025         FIN_WAIT2
tcp        0      0 :::22                  :::*                        LISTEN
!

:<<!
下面是最简单最常用的awk示例，其输出第1列和第4例， 
其中单引号中的被大括号括着的就是awk的语句，注意，其只能被单引号包含。
其中的$1..$n表示第几例。注：$0表示整个行。和C语言的printf没什么两样
!

text=awk-test-data
# awk {action} filename
# awk -F' ' '{print $4}' $text > /dev/ttys003

echo 
echo "----------------------------"

# awk pattern {action} filename
awk -F' ' '$3 ~ /^1/ {print $4}' $text > /dev/ttys003


# awk '{print $1, $4}' $test_file 
# echo ------------------------------------------
# awk '{printf "%-8s %-8s %-8s %-18s %-22s %-15s\n",$1,$2,$3,$4,$5,$6}' $test_file
# echo ------------------------------------------

# # 过滤记录
# # 下面过滤条件为：第三列的值为0 && 第6列的值为LISTEN
# awk '$3==0 && $6=="LISTEN" ' $test_file
# # 其中的“==”为比较运算符。其他比较运算符：!=, >, <, >=, <=
# echo ------------------------------------------
# awk ' $3>0 {print $0}' $test_file # $0 表示所有，$1 表示第一列
# echo ------------------------------------------
# # 如果我们需要表头的话，我们可以引入内建变量NR：
# awk '$3==0 && $6=="LISTEN" || NR==1 ' $test_file
# echo ------------------------------------------
# awk '$3==0 && $6=="LISTEN" || NR==1 {printf "%-20s %-20s %s\n",$4,$5,$6}' $test_file
# :<<!
# awk的一些内建变量：
# $0		    当前记录（这个变量中存放着整个行的内容）
# $1~$n			当前记录的第n个字段，字段间由FS分隔
# FS		    输入字段分隔符 默认是空格或Tab
# NF		    当前记录中的字段个数，就是有多少列
# NR		    已经读出的记录数，就是行号，从1开始，如果有多个文件话，这个值也是不断累加中。
# FNR	    	当前记录数，与NR不同的是，这个值会是各个文件自己的行号
# RS		    输入的记录分隔符， 默认为换行符
# OFS	    	输出字段分隔符， 默认也是空格
# ORS	    	输出的记录分隔符，默认为换行符
# FILENAME	当前输入文件的名字
# !
# echo ------------------------------------------
# # 如果要输出行号：
# awk '$3==0 && $6=="ESTABLISHED" || NR==1 {printf "%02s %s %-20s %-20s %s\n",NR, FNR, $4,$5,$6}'  $test_file
# echo ------------------------------------------
# # 指定分隔符
# awk  'BEGIN{FS=":"} {print $1,$3,$6}' /etc/passwd
# echo ------------------------------------------
# # 上面的命令也等价于：（-F的意思就是指定分隔符）
# awk -F: '{print $1,$3,$6}' /etc/passwd
# echo ------------------------------------------
# # 以\t作为分隔符输出的例子（
# awk  -F: '{print $1,$3,$6}' OFS="\t" /etc/passwd
# echo 字符串匹配------------------------------------------
# :<<!
# 其实 ~ 表示模式开始。/ /中是模式。这就是一个正则表达式的匹配。
# !
# awk '$6 ~ /FIN/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" $test_file
# echo 字符串匹配------------------------------------------
# awk '$6 ~ /WAIT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" $test_file
# echo 字符串匹配------------------------------------------
# # awk可以像grep一样的去匹配第一行，就像这样：
# awk '/LISTEN/' $test_file
# echo 字符串匹配------------------------------------------
# # 可以使用 “/FIN|TIME/” 来匹配 FIN 或者 TIME :
# awk '$6 ~ /FIN|TIME/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" $test_file
# echo 字符串匹配------------------------------------------
# # 模式取反的例子：
# awk '$6 !~ /WAIT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" $test_file

