#!/bin/bash 

WARNAME=Voting
WARFOLDER=Voting__.war
CATCONTAINER=cat1
CATPORT=8080
DOCKMACH=default
DOCKIP=$(docker-machine ip "${DOCKMACH}" 2>/dev/null)

if [ $? -ne 0 ]
then
	echo "Docker machine is not running - exiting" >&2
	exit 1
fi

echo "Rebuilding the Voting Machine WAR file"

# Put the class files into the skeleton WAR directory
# Java class files must be under WEB-INF/classes
cp -vr build/* "${WARFOLDER}/WEB-INF/classes"

# Go into the skeleton WAR file so that 'jar' command will use it as 
# the root of the WAR
(
	pushd "${WARFOLDER}"; 
	jar cvf ../"${WARNAME}.war" *
)
# The parentheses create a bash "sub-shell" that goes into the WAR folder, 
# builds the WAR, then exits
# jar "c" - create
# jar "v" - verbose
# jar "f ../Voting.war" - name of the output file is ../Voting.war

echo "Opening the Tomcat manager page.  Find '$WARNAME' and undeploy the voting app"
open http://${DOCKIP}:${CATPORT}/manager/html

echo "Waiting for undeploy"
pause

echo "Removing cached WAR files"
docker exec -it "$CATCONTAINER" rm -frv "/usr/local/tomcat/work/Catalina/localhost/$WARNAME"

echo "Reopening manager. Scroll down to 'Deploy', and under 'WAR file to deploy',"
echo "Select the newly-built ${WARNAME}.war file and click Deploy"
open http://${DOCKIP}:${CATPORT}/manager/html
