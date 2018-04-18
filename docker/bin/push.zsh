#!/bin/zsh

cd /root/mstdn.zsh
git pull

cd /root/mstdn.page
git pull

cd /root
/root/mstdn.zsh/mstdn.zsh a
/root/mstdn.zsh/mstdn.zsh account
/root/mstdn.zsh/mstdn.zsh status
/root/mstdn.zsh/mstdn.zsh status_backup https://gitlab.com/syui/mstdn.page/raw/master/public/json/toot.json
mv /root/mstdn.zsh/index.html /root/mstdn.page/public/json/toot.json

cd /root/mstdn.page
git add .
git commit -m "update json" > /dev/null 
git push -u origin master > /dev/null 
