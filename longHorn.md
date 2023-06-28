## How to install LongHorn..

```
pre-requisite check.
curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/master/scripts/environment_check.sh | bash
apt-get install open-iscsi -y
systemc is-enabled iscsid.socket

```
## restart longhorn
```
#!/bin/bash
kubectl rollout restart daemonset engine-image-ei-d4c780c6 -n longhorn-system
kubectl rollout restart daemonset longhorn-csi-plugin -n longhorn-system
kubectl rollout restart daemonset longhorn-manager -n longhorn-system

kubectl rollout restart deploy csi-attacher -n longhorn-system
kubectl rollout restart deploy csi-provisioner -n longhorn-system
kubectl rollout restart deploy csi-resizer -n longhorn-system
kubectl rollout restart deploy csi-snapshotter -n longhorn-system
kubectl rollout restart deploy longhorn-driver-deployer -n longhorn-system
kubectl rollout restart deploy longhorn-ui -n longhorn-system
```
