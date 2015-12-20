#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

apt-get install bridge-utils

mkdir /etc/kubernetes
cp -f ./rootfs/etc/kubernetes/k8s.conf /etc/kubernetes/k8s.conf

cp -f ./rootfs/lib/systemd/system/docker-bootstrap.service /lib/systemd/system/docker-bootstrap.service
cp -f ./rootfs/lib/systemd/system/docker-bootstrap.socket /lib/systemd/system/docker-bootstrap.socket
cp -f ./rootfs/lib/systemd/system/k8s-flannel.service /lib/systemd/system/k8s-flannel.service
cp -f ./rootfs/lib/systemd/system/docker.service /lib/systemd/system/docker.service
cp -f ./rootfs/lib/systemd/system/docker.socket /lib/systemd/system/docker.socket
cp -f ./rootfs/lib/systemd/system/k8s-worker.service /lib/systemd/system/k8s-worker.service

systemctl daemon-reload

systemctl stop docker.service

systemctl enable docker-bootstrap.service k8s-flannel.service k8s-worker.service

systemctl start docker-bootstrap.service
systemctl start k8s-flannel.service
systemctl start docker.service
systemctl start k8s-worker.service
