# python3pwn
build docker image including python3 with pwntools and maybe some other useful stuff

## misc
docker build --rm=true -t jfloff/pwn .


docker run --rm -t jfloff/pwn

docker run --rm -ti -v "/home/$USER/code":/code -v "$PWD":/pwn  lefty01/py3pwn
docker run --rm -ti -v "/home/$USER/code":/code -v "$PWD":/pwn  lefty01/py3pwn /bin/bash
docker run --rm -ti -v "/home/$USER/code":/code -p 5000:5000 lefty01/py3pwn bash


docker login

docker tag jfloff/pwn lefty01/py3pwn:latest
docker push lefty01/py3pwn:latest

