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

### Import the container

`docker import cat1-Phase0-container.tar`

This leaves an unnamed image.  Find it with 

`docker images`

Get the hash/ID and use it to start the image:

`docker run --name cat2 -d -p 8080:8080 -p 8009:8009 68240ae3c8be /usr/local/tomcat/bin/catalina.sh run`

