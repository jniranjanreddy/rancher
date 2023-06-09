## Create secrets from Command Line..
```
kubectl create secret generic authorization \
--from-literal=POSTGRES_HOST=devdb.jnrlabs.com \
--from-literal=POSTGRES_PORT=5432 \
--from-literal=POSTGRES_DATABASE=devdb01 \
--from-literal=POSTGRES_USER=devops \
--from-literal=POSTGRES_PASSWORD=PassworD \
--from-literal=Environment=dev \
--from-literal=LOB=healthcare
```

## create Secrets
```
kubectl create secret generic for-testing --from-literal=USERNAME=devops --from-literal=PASSWORD=password
```
## Updating/patching a secrets
## NOTE:  the valuse should be in base64
```
kubectl patch secret for-testing --type='json' -p='[{"op" : "replace" ,"path" : "/data/USERNAME" ,"value" : "Njc4OTEwCg=="}]'
```
