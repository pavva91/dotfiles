## Create Image from Dockerfile
docker build . -t <image_name>
docker build . -t java-vim

## Run Container
docker run -it --rm <image_name>

## Run Container on a project
docker run -it --rm -v /absolute/path/host/to/project:/absolute/path/container/to/project <image_name>

## Run Container in detached mode
docker run --name java-ide -d -t java-vim
docker run --rm --name java-ide -d -v ~/SynologyDrive/Code/java/myproject/:/root/javaproject -t java-vim

## Enter the container
docker exec -it java-ide bash

## Issues with Go LSP
