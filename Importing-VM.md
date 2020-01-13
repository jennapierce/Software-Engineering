# Notes on Working with VirtualBox

## Export/import docker machine

I tried this command to import the existing VM to use with docker-machine

docker-machine create --driver virtualbox --virtualbox-no-vtx-check --virtualbox-import-boot2docker-vm COSC-A451-Voting-Machine COSC-A451-Voting-Machine

DOES NOT WORK

## Export Container... 1 gb

did an export from the container...

`docker export 948ac554455fa -o cat1-Phase0-container.tar`

## Import Container... gives an image, not a container

First, create a docker machine:

`docker-machine start`

### Open Ports on virtualbox

need to open 8080 and 8009 on virtualbox.  Open the VirtualBox Manager and select the Settings on the `default` virtual machine.

Switch to Network and open the first network interface ("NAT")

Click on "port forwarding"

Click the "plus" icon at upper right and enter name tomcat-main, port 8080 to port 8080

Click the "plus" icon again and enter name tomcat-control, port 8009 to port 8009

### Where's the Container?

The container is on the class google drive "Student resources"

### Import the container

`docker import cat1-Phase0-container.tar`

This leaves an unnamed image.  Find it with 

`docker images`

```bash
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              5ddfbb25089c        20 minutes ago      1GB
hello-world         latest              fce289e99eb9        12 months ago       1.84kB

```

Get the hash/ID and use it to start the image:

`docker run --name cat1 -d -p 8080:8080 -p 8009:8009 5ddfbb /usr/local/tomcat/bin/catalina.sh run `

![](images/2020-01-12 20_41_35-MINGW64__c_Program Files_Docker Toolbox.png)