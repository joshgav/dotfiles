#! /usr/bin/env bash

__dirname="$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)"
member_number=$(echo ${HOSTNAME#jugsrv0})
ETCD_VER=3.3.12

install-etcd () {
  TMPDIR=$(mktemp --directory)
  pushd ${TMPDIR}
  curl -# -L -O \
    https://github.com/etcd-io/etcd/releases/download/v${ETCD_VER}/etcd-v${ETCD_VER}-linux-amd64.tar.gz
  tar -xzf etcd-v${ETCD_VER}-linux-amd64.tar.gz
  cp etcd-v${ETCD_VER}-linux-amd64/etcd* /usr/bin/
  popd && rm -rf ${TMPDIR}
}

configure-etcd () {
  useradd --system etcd

  # prepare config file
  mkdir -p /etc/etcd/
  cp ${__dirname}/config${member_number} /etc/etcd/config

  # prepare data dir
  mkdir -p /var/lib/etcd/
  chown -R etcd:etcd /var/lib/etcd/

  # prepare etcd.service
  cp ${__dirname}/etcd.service /etc/systemd/system/etcd.service

  # activate the service
  systemctl daemon-reload
  systemctl enable --now --system etcd.service
}

etcd=$(which etcd)
if [[ -z "$etcd" ]]; then
  install-etcd
else
  >&2 echo "etcd in PATH: [${etcd}]"
  >&2 echo "stopping"
  exit 2
fi

etcd_enabled=$(systemctl is-enabled etcd.service)
if [[ -z "$enabled" ]]; then 
  configure-etcd
else
  >&2 echo "etcd.service is enabled"
  >&2 echo "stopping"
  exit 3
fi
