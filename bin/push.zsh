#!/bin/zsh

cd /root/mstdn.zsh
git pull

cd /root/mstdn.page
git pull

cd /root/
mstdn.zsh -a
mstdn.zsh status_backup https://gitlab.com/syui/mstdn.page/raw/master/public/index.html
mv /root/index.html /root/mstdn.page/public

cd /root/mstdn.page
git add .
git commit -m "update json" > /dev/null 
git push -u origin master > /dev/null 
