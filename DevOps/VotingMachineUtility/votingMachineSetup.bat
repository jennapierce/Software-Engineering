@ECHO OFF

TITLE Voting Machine Setup


ECHO This bat file sets up everything needed to run the voting machine software
ECHO Continue to login to docker
ECHO ==========================================================================
PAUSE
CLS
docker login
PAUSE 
CLS

:startMenu
CLS
ECHO 		MAIN MENU
ECHO.
ECHO 1.)View required files
ECHO 2.)Setup Docker
ECHO 3.)Start Container
ECHO 4.)Stop Container
ECHO 5.)Clear Docker
ECHO 6.)QUIT
ECHO.
set /p userChoice=Menu choice(1,2,3,etc.):
GOTO %userChoice%

:1
cls
ECHO This shows required files
set /p userChoice1=Would you like to see the required files(y/n)?: 
IF "%userChoice1%"=="n" (GOTO startMenu)
CLS
ECHO.
ECHO 		REQUIRED FILES:
ECHO.

ECHO    Java Development Kit 8 
ECHO (https://www.oracle.com/technetwork/java/javase/downloads/index.html)
ECHO    VirtualBox (virtualbox.org)
ECHO    Docker (docker.com) - use the Docker Toolbox if needed 
ECHO (https://github.com/docker/toolbox/releases)
ECHO    Git (git-scm.com) and/or GitHub Desktop (https://desktop.github.com)

PAUSE
GOTO startMenu

:2
ECHO.
ECHO		DOCKER SETUP
cls
docker ps -a
ECHO Look at the above table and see if you have any containers open
set /p anyContainers="Do you have any containers(enter yes or no):"

IF "%anyContainers%" == "yes" (GOTO haveContainers)
docker image prune -a
set /p imageFilePath="Your image file path:"
docker import "%imageFilePath%"
docker images
ECHO Take your hash code from the table above and enter it in the prompt below
ECHO (Working on automating this but for now, tough buns!)	
set /p HASHCODEINPUT="Image ID:"

set /p containerName="Name your container(just put cat1):"
ECHO Opening port 8080 and 8009 by default
docker run --name %containerName%-d -p 8080:8080 -p 8009:8009 %HASHCODEINPUT% /usr/local/tomcat/bin/catalina.sh run

docker-machine ip

:haveContainers
ECHO If you already have a container, it should not be necessary to re-setup docker. 
ECHO If you would like to reset docker, go to the main menu and go to the "Clear Docker" function. 
PAUSE
GOTO startMenu

:3
ECHO.
ECHO 		START CONTAINER

ECHO.

docker ps -a

ECHO.
ECHO Look at the above table and pick which container you would 
ECHO like to start. (Look under the NAMES column)
ECHO.
set /p containerToStart= Which container would you like to start?:
docker container start %containerToStart%
GOTO startMenu

:4
ECHO.
ECHO 		STOP CONTAINER

ECHO.

docker ps -a

ECHO.
ECHO Look at the above table and pick which container you would 
ECHO like to stop. (Look under the NAMES column)
ECHO.
set /p containerToStop= Which container would you like to stop?:
docker container stop %containerToStop%
ECHO %containerToStop% container stopped!
PAUSE
GOTO startMenu

:5
ECHO.
ECHO		CLEAR DOCKER
docker container prune -f
docker image prune -a
ECHO Docker is cleared of all images and containers.
PAUSE
GOTO startMenu