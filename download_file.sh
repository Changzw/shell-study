#!/bin/sh

root="https://chriszheng.science/pua-books/"
curl $root |
awk 'BEGIN{
RS="</a>"
IGNORECASE=1
}
{
  for(o=1;o<=NF;o++){
    if ( $o ~ /href/){
      gsub(/.*href=\042/,"",$o)
      gsub(/\042.*/,"",$o)
      print $(o)
    }
  }
}' #index.html
# grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' | 
# sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i'