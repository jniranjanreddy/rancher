#!/bin/bash 

# $1 = Cert namespace
# $2 = namespace

echo ${1}
echo ${2}
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out ${1}-tls.crt -keyout ${1}-tls.key -subj "/CN=${1}/O=${$1}-tls"
kubectl create secret tls ${1}-tls --namespace ${2} --key ${1}-tls.key --cert ${1}.crt
