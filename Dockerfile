FROM maven:3-openjdk-17-slim
WORKDIR /app
COPY . .
RUN mvn clean install -Dmaven.test.skip=true
ENTRYPOINT "mvn" "spring-boot:run" "-pl" "user-microservice"