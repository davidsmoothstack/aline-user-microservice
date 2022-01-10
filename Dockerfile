ARG SERVICE_NAME=user-microservice
ARG VERSION=0.1.0
ARG JAR_NAME=$SERVICE_NAME-$VERSION.jar
ARG JAR_PATH=$SERVICE_NAME/target/$JAR_NAME

FROM maven:3-openjdk-17-slim as build
ARG SERVICE_NAME
WORKDIR /app

# Install dependencies
COPY pom.xml .
COPY core/pom.xml core/
COPY $SERVICE_NAME/pom.xml $SERVICE_NAME/
RUN mvn dependency:go-offline -Dmaven.test.skip=true

# Copy everything
COPY . .
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:8-alpine
ARG JAR_PATH
COPY --from=build /app/$JAR_PATH app.jar
CMD "java" "-jar" "app.jar"