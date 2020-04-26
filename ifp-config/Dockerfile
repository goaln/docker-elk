FROM openjdk:8-jdk-alpine

ARG JAR_FILE=./ifp-config.jar

COPY ${JAR_FILE} app.jar

EXPOSE 7070/tcp

ENTRYPOINT ["java","-jar","/app.jar"]
