FROM maven:3-openjdk-11-slim
COPY . .
# RUN mvn clean install
ENTRYPOINT [ "mvn" ]
CMD [ "spring-boot:run -pl underwriter-microservice" ]