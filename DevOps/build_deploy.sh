#!/bin/bash 

cp -v build/*.class Voting__.war/WEB-INF/classes

(pushd Voting__.war; jar cfv ../Voting.war *)

echo "Now undeploy the voting app"
open http://localhost:8080/manager/html

pause

docker exec -it cat1 rm -frv /usr/local/tomcat/work/Catalina/localhost/Voting

echo "Now deploy the new WAR from the new Voting.war file"
open http://localhost:8080/manager/html
