#!/bin/bash
# $1： 1 表示支持xcode 12，不传或者非1则恢复原样
# 临时把环信切到旧版，以支持在Xcode12打开Sawa

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

echo '使用说明：传入参数1 表示支持xcode 12,不传或者非1则恢复原样,在签入代码前必须先恢复原样\n'


if [ "$1" == "1" ] ;then
    echo "新旧版环信SDK model名字不同，批量把import HyphenateChat改为import HyphenateLite"
    grep -ril 'import HyphenateChat' Sawa | xargs -I@ sed -i "" 's/import HyphenateChat/import HyphenateLite/g' @

    echo "新旧版环信SDK 个别类名不同，增加别名：typealias EMChatMessage = EMMessage"
    mockCode="typealias EMChatMessage = EMMessage;extension UITableView { var sectionHeaderTopPadding: CGFloat? { get { 0 } set {} } };"
    echo $mockCode >> $SCRIPTPATH/../Sawa/Entrance/AppDelegate.swift

    echo "环信新版isAutoDownloadThumbnail接口变化"
    sed -i "" "s/EMClient.shared()?.options.autoDownloadThumbnail/EMClient.shared()?.options.isAutoDownloadThumbnail/g" ./Sawa/Model/Hyphenate/HyphenateManager.swift

    echo "Podfile_cmd.rb切成旧版环信SDK，并自动pod install"
    sed -i "" "s/block.call 'HyphenateChat', '3.9.0'/block.call'HyphenateLite', '3.6.2'/g" $SCRIPTPATH/../Podfile_cmd.rb
    bundle exec pod install

    echo "环信新版EMErrorCode枚举新增了两个case"
    sed -i "" 's/EMErrorCallSpeakerFull          /EMErrorCallSpeakerFull,EMErrorUserAlreadyLoginSame,EMErrorUserAlreadyLoginAnother/g' $SCRIPTPATH/../Pods/HyphenateLite/iOS_Pods_IMSDK_V3.6.2/HyphenateLite.framework/Headers/EMErrorCode.h
else
    echo "新旧版环信SDK model名字不同，批量把import HyphenateLite恢复为import HyphenateChat"
    grep -ril 'import HyphenateLite' Sawa | xargs -I@ sed -i "" 's/import HyphenateLite/import HyphenateChat/g' @

    echo "新旧版环信SDK 个别类名不同，删除别名：typealias EMChatMessage = EMMessage"
    sed -i "" "/typealias EMChatMessage = EMMessage/d" $SCRIPTPATH/../Sawa/Entrance/AppDelegate.swift

    echo "环信新版isAutoDownloadThumbnail接口变化"
    sed -i "" "s/EMClient.shared()?.options.isAutoDownloadThumbnail/EMClient.shared()?.options.autoDownloadThumbnail/g" ./Sawa/Model/Hyphenate/HyphenateManager.swift

    echo "Podfile_cmd.rb切回新版环信SDK，并自动pod install"
    sed -i "" "s/block.call'HyphenateLite', '3.6.2'/block.call 'HyphenateChat', '3.9.0'/g" $SCRIPTPATH/../Podfile_cmd.rb
    bundle exec pod install
fi