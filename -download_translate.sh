#!/bin/bash
bookId=shtcnZpcv1ifedFu6J58p69upJR
lprojs=('ar' 'zh-Hans' 'en')
requestLangs=('阿拉' '中文' '阿拉') #英文的strings文件也填入阿语翻译

for i in "${!lprojs[@]}";
do
  path=`pwd`/Sawa/Resource/Common/Others/${lprojs[i]}.lproj/NewLocalizable.strings
  url="https://zvod-release.badambiz.com/translation/ios?bookId=$bookId&lang=${requestLangs[i]}"
  echo "下载翻译: $url ==> $path"
  curl $url > $path
done
