#!/bin/awk -f

BEGIN{
		FS="[</a>]"
		$0 ~ /href/
    print "User\t\tUID"
    print "----------------"
}

{printf "%-15s %s\n",$2,$3}

END{
    print "end"
}