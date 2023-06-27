## find a pod with its IPAddress
```
kubectl get --output json  pods | jq '.items[] | select(.status.podIP=="10.42.4.144")' | jq .metadata.name
"longhorn-ui-68799c7dbc-xwvct"

 kubectl get --output json  pods | jq '.items[] | select(.status.podIP=="10.42.4.144")' | jq .metadata.namespace
"longhorn-system"
```
