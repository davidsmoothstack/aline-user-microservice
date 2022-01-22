ARG SERVICE_NAME=user-microservice
ARG JAR_FULL_PATH=$SERVICE_NAME/target/*.jar

FROM openjdk:8-jre-alpine3.9
ARG JAR_FULL_PATH
COPY $JAR_FULL_PATH app.jar
CMD "java" "-jar" "app.jar"