
# Docker support for Laravel Projects & Mysql

## Clone laravel source
```bash
git clone https://github.com/laravel/laravel.git api
```
## Installation

Download this gist into your project folder.

## Usage
```bash
docker-compose up -d
```

## Setup ENV & Composer Dependencies
```bash
# copy .env
docker-compose exec api cp -v .env.example .env

# Composer Install
docker-compose exec api composer install

# generate key
docker-compose exec api php artisan key:generate

# optimize
docker-compose exec api php artisan cache:clear
```

## Docker command
```bash
# Run a command in a running container
docker exec -it [container ID] bash

# Stop all container
docker stop $(docker ps -a -q)

# Remove all container
docker rm $(docker ps -a -q) -f

# Remove all imgaes
docker rmi $(docker images -a -q) -f

# show list container
docker ps -a

# show list imgaes
docker imgaes
```