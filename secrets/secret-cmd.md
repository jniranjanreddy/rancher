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
root@minikube01 /myworkspace/kubernetes # echo "678910" | base64
Njc4OTEwCg==
```
```
kubectl patch secret for-testing --type='json' -p='[{"op" : "replace" ,"path" : "/data/USERNAME" ,"value" : "Njc4OTEwCg=="}]'
```
## Mounting Secrets as file
```
root@minikube01 /myworkspace/kubernetes # cat /tmp/sec-in-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-test-pod
spec:
  containers:
    - name: test-container
      image: nginx
      volumeMounts:
        # name must match the volume name below
        - name: production-env
          mountPath: /etc/production.env
          readOnly: true
  # The secret data is exposed to Containers in the Pod through a Volume.
  volumes:
    - name: production-env
      secret:
        secretName: for-testing
```
```
kubectl apply -f /tmp/sec-in-pod.yaml

root@minikube01 /myworkspace/kubernetes # k get pods
NAME              READY   STATUS    RESTARTS   AGE
secret-test-pod   1/1     Running   0          10m

root@minikube01 /myworkspace/kubernetes # k exec secret-test-pod -- ls -ld /etc/production.env
drwxrwxrwt. 3 root root 140 Jun  9 17:39 /etc/production.env

root@minikube01 /myworkspace/kubernetes # k exec secret-test-pod -- ls -l /etc/production.env
total 0
lrwxrwxrwx. 1 root root 15 Jun  9 17:39 PASSWORD -> ..data/PASSWORD
lrwxrwxrwx. 1 root root 15 Jun  9 17:39 USERNAME -> ..data/USERNAME
lrwxrwxrwx. 1 root root 15 Jun  9 17:39 username -> ..data/username

```
