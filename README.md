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
sudo chmod 700 script/bootstrap
script/bootstrap
```

Setup Nginx Vhosts:

```shell
export SITE="chauke.org" # Change me
sed -i "s/example.com;/$SITE;/g" conf.d/example.com.conf
sed -i "s/example.com/$SITE/g" conf.d/example.com.conf
sed -i "s/example.com/$SITE/g" docker-compose.yml
mv conf.d/example.com.conf conf.d/"$SITE.conf" 
```

Edit environment variables:

```shell
sudo touch /etc/default/redis
sudo touch /etc/default/nginx
sudo touch /etc/default/chroma
sudo vi /etc/default/postgres
    # POSTGRES_USER=postgres
    # POSTGRES_PASSWORD=secure-pass-word
    # POSTGRES_DB=postgres

```

Run docker services:

```shell
sudo docker compose up
```
