#!/bin/zsh

json=${0:a:h}/toot.json
if [ ! -f $json ];then
	curl -sOL https://gitlab.com/syui/mstdn.page/raw/master/public/json/toot.json
fi
n=`cat "$json"|jq length`
n=`expr $n - 1`
echo "[" >! ${json}.back
for ((i=0;i<=$n;i++))
do
	
	created_at=`cat $json| jq -r ".[$i].created_at"`
	if [ "$created_at" = "null" ];then
		if [ $i -eq 0 ];then
		else
			echo ,
		fi
		id=`cat $json| jq -r ".[$i].id"`
		content=`cat $json| jq -r ".[$i].content"|sed 's/"/\\\"/g'`
		echo -e "{
		\"id\":\"$id\",
		\"content\":\"$content\",
		\"created_at\": \"no date\"
		}
		"
	else
		if [ $i -eq 0 ];then
			cat $json | jq ".[$i]"
		else
			echo ,
			cat $json | jq ".[$i]"
		fi
	fi
	if [ $i -eq $n ];then
		echo "]"
	fi
done >> ${json}.back

cat ${json}.back | jq .
