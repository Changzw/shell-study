#!/bin/bash
#$2: 1表示批量关注$1传入的uid，0表示批量取消关注

if  [ ! -n "$1" ] ;then
    echo "参数1必须传入收IM的uid"
    exit 1
fi

if  [ ! -n "$2" ] ;then
    echo "参数2必须传值，1表示批量关注，0表示批量取消关注"
    exit 1
fi

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

uids=( $( cat $SCRIPTPATH/ksa_uid_user.txt ) )
uid_count=${#uids[@]}

index=0
for line in ${uids[@]}
do
    uid=`echo ${line} | tr -d '\r'`

    #关注
    if [ "$2" == "1" ]
    then
        url="https://test07-pk.badambiz.com/api/follow/add/?session_key=testskey_${uid}&follow_uid=${1}"
        # echo "url:${url}"
    #取消关注
    elif [ "$2" == "0" ]
    then
        url="https://test07-pk.badambiz.com/api/follow/delete/?session_key=testskey_${uid}&follow_uid=${1}"
        # echo "url:${url}"
    fi

    index=$(($index+1))
    printf "\r${index}/${uid_count}"
    curl -s ${url} &>/dev/null


done