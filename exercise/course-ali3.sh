#!/bin/sh

: '
case: 控制
case expression in
    pattern1)
        statement1
        ;;
    pattern2)
        statement2
        ;;
    pattern3)
        statement3
        ;;
    ……
    *)
        statementn
esac

for done 
使用 (()) 扩展shell 中算数和赋值运算使用方法
for 嵌套
break continue
shift
函数使用方法
'

for num in `seq 1 7`; do
case $num in
1)
	echo "Monday"
	;;
2)
	echo "Tuesday"
	;;
3)
	echo "Wednesday"
	;;
4)
	echo "Thursday"
	;;
5)
	echo "Friday"
	;;
6)
	echo "Saturday"
	;;
7)
	echo "Sunday"
	;;
*)
	echo "error"
	;;
esac
done

: '
printf "Input a character: "
read -n 1 char
case $char in
    [a-zA-Z])
        printf "\nletter\n"
        ;;
    [0-9])
        printf "\nDigit\n"
        ;;
    [0-9])
        printf "\nDigit\n"
        ;;
    [,.?!])
        printf "\nPunctuation\n"
        ;;
    *)
        printf "\nerror\n"
esac
'

left=9
right=9
while [ $left -gt 0 ] 
do
	left=$left-1
done
echo finish

: '
使用 [] 的时候，必须保证元素之间有空格，四则运算也只能借助 expr 完成
(()) 语法
((表达式1，表达式2……))，
1. 在双括号表达式中，所有表达式可以向 c++ 中那样eg a++, b--
2. 双括号可以进行 四则运算，逻辑运算
3. 在双括号中，所有变量可以不加 $ 符号
4. 扩展了 for while if 
5. 支持多个表达式，表达式之间使用 ',' 分割
'

exp2=1 
result=($exp2)
while ((exp2<100))
do 
echo "value: $exp2"
((exp2=exp2*2))
result+=($exp2)
done

echo ${result[*]}

array0=(1 2 3)
array0+=(4)
echo ${array0[*]}

col=0
row=0
while [ 10 -gt $col ] ; do 
	rowStar=""
	while [ 10 -gt $row ] ; do 
		rowStar="$rowStar*"
		row=$row+1
	done
	echo $rowStar
	col=$col+1
done 
