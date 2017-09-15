#!/bin/bash
wget https://download.docker.com/linux/static/stable/armhf/docker-17.06.2-ce.tgz -O /tmp/docker.tgz
tar xzf /tmp/docker.tgz
cd docker
cp -f * /usr/bin

