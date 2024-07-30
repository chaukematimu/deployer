# Production Deployment

This projects aims at making production deployments less of a pain.

Following dependencies will be installed:

- [Docker](https://docs.docker.com/engine/install/)

## Getting Started

Adding a deploy user :

```shell
sudo useradd --create-home -s /bin/bash deploy
sudo adduser deploy sudo
sudo passwd deploy
sudo su - deploy # switch to deploy user
```

Clone project:

```shell
cd ~
git clone https://github.com/chaukematimu/deployer.git
cd deployer
```

Install system dependencies:

```shell
sudo chmod 700 script/*
script/bootstrap
```

Setup Nginx Vhosts:

```shell
export SITE="chauke.org" # Change me
script/setup
```

Edit environment variables:

```shell
sudo vi /etc/default/redis
sudo vi /etc/default/nginx
sudo vi /etc/default/chroma
sudo vi /etc/default/postgres
```

Run docker services:

```shell
sudo docker compose up
```
