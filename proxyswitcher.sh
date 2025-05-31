#!/bin/bash

PROXY_HTTP="http://127.0.0.1:2081"
PROXY_SOCKS="socks5://127.0.0.1:2080"

# Update with your actual cluster IP if different
MINIKUBE_SUBNET="192.168.49.0/24"
K8S_SERVICE_CIDR="10.96.0.0/12"
K8S_DNS_NAMES="localhost,127.0.0.1,kubernetes.default.svc,kubernetes"

function enable_proxy() {
  export http_proxy="$PROXY_HTTP"
  export https_proxy="$PROXY_HTTP"
  export ftp_proxy="$PROXY_HTTP"
  export all_proxy="$PROXY_SOCKS"
  export no_proxy="$K8S_DNS_NAMES,$MINIKUBE_SUBNET,$K8S_SERVICE_CIDR"
  echo "Proxy enabled."
}

function disable_proxy() {
  unset http_proxy https_proxy ftp_proxy all_proxy no_proxy
  echo "Proxy disabled."
}

if [[ "$1" == "on" ]]; then
  enable_proxy
elif [[ "$1" == "off" ]]; then
  disable_proxy
else
  echo "Usage: myproxy [on|off]"
fi
