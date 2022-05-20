#!/bin/bash
name="changzhongwei"
echo name 
echo "for in read-------------"
for file in `ls`; do 
	# readonly file
	echo $file
done

echo "while read--------------"
ls |
while	read item 
do
	echo $item 
done
echo "end --------------------"
#readonly
# readonly name
# name=3

#delete variable
unset name
echo $name

echo "hhhh${file}bbb"

# array 