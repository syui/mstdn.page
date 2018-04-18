https://gitlab.com/syui/mstdn.zsh

> user.json

```json
{
	"host":"syui.ml",
	"app":"mstdn.zsh",
	"username":"$email",
	"password":"$password",
	"token":"$token"
}
```

https://stedolan.github.io/jq/download/

> bin/jq-32,jq-64

```sh
$ sudo docker build -t syui/mstdn-page --build-arg TOKEN=`cat ./user.json|jq -r .token` .
$ sudo docker run -it syui/mstdn-page push.zsh
```
