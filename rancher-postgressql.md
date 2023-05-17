## This is to install postgresql in Rancher 2.6.11
```
Go to Rancher Apps -> select bitnami/postgrsql
update below variabes, then install, postgres should work properly

auth:
  database: postgres
  password: password
  postgresPassword: password
  replicationPassword: password
global:
  cattle:
    systemProjectId: p-tnqbm
  storageClass: longhorn
metrics:
  serviceMonitor:
    namespace: devops
primary:
  service:
    type: NodePort

```
