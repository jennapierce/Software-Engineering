FOR /F "tokens=*" %%a IN ('docker-machine ip') DO @start http://%%a:8080