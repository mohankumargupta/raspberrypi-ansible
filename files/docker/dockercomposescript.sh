#!/usr/bin/env bash
cd /storage/docker
docker pull calangoclube/rpi-apache
docker pull portainer/portainer:linux-arm
docker pull dastrasmue/rpi-samba:v3
docker pull 
docker pull 
sleep 5
systemctl stop docker
sleep 5
systemctl start docker
sleep 5
docker-compose up -d 2>/dev/null >/dev/null