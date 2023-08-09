
## Patching Resources
```
Patching a Ingress path to a rule.
Example ingress rule file, it has two paths beer and wine, if we want to add cosmo path, then we need to execute the patch command.

root@uat-clus01:/mySpace/rancher/path-based/pub# cat pub-ingress.yaml
kind: Ingress
metadata:
  annotations:
  name: pub
  namespace: cafe
spec:
  rules:
  - host: pub.rlabs.com
    http:
      paths:
      - path: /beer
        pathType: Prefix
        backend:
          service:
            name: beer-svc
            port:
              number: 80
      - path: /wine
        pathType: Prefix
        backend:
          service:
            name: wine-svc
            port:
              number: 80
  tls:
    - hosts:
        - cafe
      secretName: cafe-tls


root@uat-clus01:/mySpace/rancher/path-based/pub# cat ingress-patch.json
[
  {
    "op": "add",
    "path": "/spec/rules/0/http/paths/-",
    "value": {
      "path": "/cosmo",
      "pathType": "Prefix",
      "backend": {
        "service": {
          "name": "cosmo-svc",
          "port": {
            "number": 80
          }
        }
      }
    }
  }
]


Command:
root@uat-clus01:/mySpace/rancher/path-based/pub# k get ing
NAME        CLASS   HOSTS            ADDRESS         PORTS     AGE
chai-pani   nginx   cafe.rlabs.com   192.168.9.134   80, 443   112d
pub         nginx   pub.rlabs.com    192.168.9.134   80, 443   118m


root@uat-clus01:/mySpace/rancher/path-based/pub# kubectl patch ingress pub -n cafe --type json --patch "$(cat ingress-patch.yaml
ingress.networking.k8s.io/pub patched

```
