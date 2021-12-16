FROM maven:3-openjdk-11-slim
WORKDIR /app
COPY . .
ENTRYPOINT [ "mvn" ]
CMD [ "spring-boot:run -pl user-microservice" ]