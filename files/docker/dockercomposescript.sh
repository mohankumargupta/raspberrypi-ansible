#!/usr/bin/env bash
cd /storage/docker
docker pull calangoclube/rpi-apache
docker pull portainer/portainer:linux-arm
docker pull dastrasmue/rpi-samba:v3
sleep 5
systemctl stop docker
sleep 5
systemctl daemon-reload
systemctl start docker
sleep 10
docker-compose up -d  >/dev/null