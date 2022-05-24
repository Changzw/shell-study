#!/bin/bash

# 调用方法: sh scripts/check_no_merge_branch.sh HEAD

# 当前版本不需要检查的分支
ignore_branches=(
    # 一般情况下不需要合并的分支，测试分支或者短期内都确认不用发布的分支
    "origin/HEAD"
    "origin/master"
    "origin/feature/baloot_lua_activity" # Baloot活动
    "origin/feature/samzj/room_animation_performance" #房间动画性能测试
    "origin/tmp/invisible_man_test" # 隐身人测试
    "origin/tmp/new_host_test"  # 新域名测试
    "origin/feature/pre_release_test" #预发布环境测试

    # are分支，不需要合入ksa
    "origin/are"

    # 本版本忽略，后续版本可能需要合并的技术需求分支
    "origin/feature/defaults" # UserDefaults优化
    "origin/ft_zq_1.1.26_UserDefaults-Injection" # UserDefaults优化
    "origin/feature/podMultiProj" #CocoaPods优化
    "origin/feature/samzj/webview_preload" #webview资源预加载
    "origin/opt/buried—point" #需要不知道是啥，但是不用合并
    "origin/opt/roomSetting-transtion" #房间设置改为push

    # 本版本忽略，后续版本可能需要合并的业务需求分支
    "origin/feature/content-audit"  #内容审核
    "origin/feature/im_opt" # IM优化
    "origin/feature/bool_encoding" # bool参数编码
    "origin/feature/cp" # cp
    "origin/feature/david/data_report" # 首页推荐埋点
    "origin/feature/room_setting_page_improve" # 房间设置页面UI还原问题
    "origin/feature/samzj/baloot_home" # 首页UI发版Baloot部分
)

function join { local IFS="$1"; shift; echo "$*"; }
ignore=$(join '|' ${ignore_branches[@]})
echo "忽略以下分支:"
for(( i=0;i<${#ignore_branches[@]};i++)) 
do
    echo ${ignore_branches[i]};
done;

echo "\033[31m未合并的分支:\033[0m"
git branch -r --no-merged $1 | cat | grep -Ev $ignore

