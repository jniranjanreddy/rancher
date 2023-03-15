## 


![image](https://user-images.githubusercontent.com/83489863/222880002-bc02519b-3c71-4f68-a3e3-1070bb77effa.png)

## important urls
```
https://rancher.com/docs/rke/latest/en/config-options/nodes/
https://www.youtube.com/watch?v=MOiDMAxQ3RM&t=5389s
https://www.ssyoutube.com/watch?v=1j5lhDzlFUM&t=2s
```
#Pre-requisites
```
for rancher version v2.5.9
sysctl -w net/netfilter/nf_conntrack_max=524288


Supported Docker verion
supported versions are [1.13.x 17.03.x 17.06.x 17.09.x 18.06.x 18.09.x 19.03.x 20.10.x]
curl https://releases.rancher.com/install-docker/20.10.sh | sh

usermod -aG docker devops

echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config  

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep download_url | grep amd64 | cut -d '"' -f 4 | wget -qi -
chmod +x rke_linux-amd64
sudo mv rke_linux-amd64 /usr/local/bin/rke
rke --version
```
## Cleanup rancher
```
docker rm -f $(docker ps -qa)
docker rmi -f $(docker images -q)
docker volume rm $(docker volume ls -q)
```
```
root@rkemas01:/myworkspace# kubectl get nodes
NAME                    STATUS   ROLES               AGE   VERSION
rkemas01.jnrlabs.com    Ready    controlplane,etcd   52m   v1.24.10
rkenode01.jnrlabs.com   Ready    worker              51m   v1.24.10
rkenode02.jnrlabs.com   Ready    worker              51m   v1.24.10


root@rkemas01:/myworkspace# rke config -l -a
v1.23.16-rancher2-1
v1.24.10-rancher4-1

```
## What is Rancher?
```

Rancher is a Kubernetes management tool to deploy and run clusters anywhere and on any provider.

Rancher can provision Kubernetes from a hosted provider, provision compute nodes and then install Kubernetes onto them, or import existing Kubernetes clusters running anywhere.

Rancher adds significant value on top of Kubernetes, first by centralizing authentication and role-based access control (RBAC) for all of the clusters, giving global admins the ability to control cluster access from one location.

It then enables detailed monitoring and alerting for clusters and their resources, ships logs to external providers, and integrates directly with Helm via the Application Catalog. If you have an external CI/CD system, you can plug it into Rancher, but if you don't, Rancher even includes Fleet to help you automatically deploy and upgrade workloads.

Rancher is a complete container management platform for Kubernetes, giving you the tools to successfully run Kubernetes anywhere.
```
## How to install Rancher
```
docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:v2.4.18
docker run -d --name=rancher-server --restart=unless-stopped -v /var/lib/rancher:/var/lib/rancher -p 8091:80 -p 443:443 --privileged rancher/rancher:v2.4.18
docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
```

```
sudo docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.9.127:8080/v1/scripts/D87F25F820E5330B9CAE:1672444800000:nxFx1XlexVT2PcMnjWvAB09qfY

sudo docker run -e CATTLE_AGENT_IP="192.168.9.94"  --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.9.127:8080/v1/scripts/D87F25F820E5330B9CAE:1672444800000:nxFx1XlexVT2PcMnjWvAB09qfY

```
