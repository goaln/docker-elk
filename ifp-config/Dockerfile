FROM openjdk:8-jdk-alpine

ARG JAR_FILE=./ifp-config.jar

COPY ${JAR_FILE} app.jar

EXPOSE 7070/tcp

COPY wait-and-start.sh /wait-and-start.sh

ENTRYPOINT ["/bin/sh","wait-and-start.sh","ifp-registry-1","8761"]
