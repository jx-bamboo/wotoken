#! /bin/bash
# cd ${PWD}&&git checkout -b test&&git pull origin test
docker stop wotoken
docker rm wotoken
file_path=$(dirname "$PWD")
docker run -d --name wotoken -v ${file_path}:/home -p 3002:3000 wotoken2.5.3 /home/docker/start.sh 