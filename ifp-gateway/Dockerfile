FROM openjdk:8-jdk-alpine

ARG JAR_FILE=./ifp-gateway.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8080/tcp

COPY ./wait-and-start.sh /wait-and-start.sh

ENTRYPOINT ["/bin/sh","/wait-and-start.sh","ifp-config","7070"]
