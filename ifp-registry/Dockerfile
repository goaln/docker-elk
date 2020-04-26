FROM openjdk:8-jdk-alpine

ARG JAR_FILE=../ifp3/ifp-registry.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8761/tcp

ENTRYPOINT ["java","-jar","/app.jar"]