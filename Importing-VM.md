# Notes on Importing and Running the VotingMaching

## Creating a docker machine

I use this command to create a new VirtualBox machine for running Docker

`docker-machine create --driver virtualbox --virtualbox-no-vtx-check default`

This creates a VM called "default" which is what is used by the `docker-machine` utility and the `docker` commands use that



## Preparing to Import

First, start the docker machine if needed:

`docker-machine start`

### Open Ports on virtualbox

need to open 8080 and 8009 on virtualbox.  Open the VirtualBox Manager and select the Settings on the `default` virtual machine.

Switch to Network and open the first network interface ("NAT")

Click on "port forwarding"

Click the "plus" icon at upper right and enter name tomcat-main, port 8080 to port 8080

Click the "plus" icon again and enter name tomcat-control, port 8009 to port 8009

### Where's the Container file?

The container is on the class google drive "Student resources".  It's called `cat1-Phase0-container.tar`.

### Import the container

You can pick up the container from wherever you downloaded it.  Be sure to give any necessary path before the name.

`docker import cat1-Phase0-container.tar`

This import will succeed, blurting out a long hashcode ID.  This ID is an (unnamed) image.  Find it with 

`docker images`

```bash
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              5ddfbb25089c        20 minutes ago      1GB
hello-world         latest              fce289e99eb9        12 months ago       1.84kB

```

Here the ID is `5ddfbb25089c`. Get your hash/ID and use it to start the image:

`docker run --name cat1 -d -p 8080:8080 -p 8009:8009 5ddfbb /usr/local/tomcat/bin/catalina.sh run`

Here I am using the name `cat1` again, but that doesn't matter.  Note in the middle of the command is the hashcode. Docker will allow you to give just a prefix to the full ID.

### Test the Container

Open your browser and browse to [http://localhost:8080](http://localhost:8080).  This is where the mysterious failures occur. However, you should see a "Tomcat" home page. If you like, you can go to the "Manager," then "List Applications," and click on "Voting."

![](images/2020-01-12 20_41_35-MINGW64__c_Program Files_Docker Toolbox.png)

## How I Exported the "Phase0" Container... 1 gb

My container is named `cat1`; the name is immaterial.  Its ID is `948ac554455fa`.  I did an export from the container...

`docker export 948ac554455fa -o cat1-Phase0-container.tar`