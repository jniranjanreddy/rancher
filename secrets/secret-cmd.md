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
