# Stage 1: Build the Spring Boot application using Maven
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY spring-boot-app /app/spring-boot-app
RUN cd /app/spring-boot-app && mvn clean package

# Stage 2: Create a minimal Docker image with the JAR file
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/spring-boot-app/target/*.jar /app/app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

