# Production Deployment

This projects aims at making production deployments less of a pain.

Following dependencies will be installed:

- [Docker](https://docs.docker.com/engine/install/)
- [pyenv](https://github.com/pyenv/pyenv)
- [nvm](https://github.com/nvm-sh/nvm)
- [supervisor](https://github.com/Supervisor/supervisor)

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
script/bootstrap
```

Edit environment variables:

```shell
vi /etc/default/redis
vi /etc/default/nginx
vi /etc/default/chroma
vi /etc/default/postgres
```

Run docker services:

```shell
docker compose up
```
