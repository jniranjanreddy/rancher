## 


![image](https://user-images.githubusercontent.com/83489863/222880002-bc02519b-3c71-4f68-a3e3-1070bb77effa.png)

#Pre-requisites
```
Supported Docker verion
supported versions are [1.13.x 17.03.x 17.06.x 17.09.x 18.06.x 18.09.x 19.03.x 20.10.x]


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
docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
```

```
sudo docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.9.127:8080/v1/scripts/D87F25F820E5330B9CAE:1672444800000:nxFx1XlexVT2PcMnjWvAB09qfY

sudo docker run -e CATTLE_AGENT_IP="192.168.9.94"  --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.9.127:8080/v1/scripts/D87F25F820E5330B9CAE:1672444800000:nxFx1XlexVT2PcMnjWvAB09qfY

```
