#!/bin/bash
name="changzhongwei"
echo name 
for file in `ls`; do 
	# readonly file
	echo $file
done

#readonly
# readonly name
# name=3

#delete variable
unset name
echo $name

echo "hhhh${file}bbb"

# array 