```sh
$ sudo docker build -t syui/mstdn-page --build-arg TOKEN=`cat ./user.json|jq -r .token` .
```
