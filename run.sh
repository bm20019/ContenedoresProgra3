#!/bin/bash
docker rm $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker-compose up
