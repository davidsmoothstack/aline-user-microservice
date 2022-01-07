FROM maven:3-openjdk-17-slim
ENV SERVICE_NAME=user-microservice
ENV VERSION=0.1.0
WORKDIR /app

# Install dependencies
COPY pom.xml .
COPY core/pom.xml core/
COPY $SERVICE_NAME/pom.xml $SERVICE_NAME/
RUN mvn dependency:go-offline -Dmaven.test.skip=true

# Copy everything
COPY . .
RUN mvn package -Dmaven.test.skip=true

CMD "java" "-jar" "$SERVICE_NAME/target/$SERVICE_NAME-$VERSION.jar"