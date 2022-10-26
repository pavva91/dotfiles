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

## Issues with coc-java
At first run will take time to start the jdt.ls, can check the status with: CocCommand workspace.showOutput java
Stucks for a while on 37% (Importing Maven project(s)) and then 69% (Configurin java project demo) Starting Java Language Server
First run start: 4:30:08
First run end: 4:36:17
Check with: CocList extensions
if not coc-java not present run: CocInstall coc-java

and then: CocCommand java.updateLanguageServer

now JDT.ls should run correctly
