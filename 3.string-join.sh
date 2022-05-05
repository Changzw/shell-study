#!/bin/bash
for file in `sh 1.helloworld.sh`; do 
	# readonly file
	echo $file
done

echo "hhhh${file}bbb"
echo "hhhh\"$file\"bbb"
