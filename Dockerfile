# Stage 1:
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY spring-boot-app /app/spring-boot-app
RUN cd /app/spring-boot-app && mvn clean package

# Stage 2:
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/spring-boot-app/target/*.jar /app/app.jar

EXPOSE 8080

# Download OpenTelemetry Java Agent using curl
RUN apt-get update && apt-get install -y curl
RUN curl -L -o /app/opentelemetry-javaagent.jar https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar

# Set environment variables for OpenTelemetry
ENV JAVA_TOOL_OPTIONS="-javaagent:/app/opentelemetry-javaagent.jar"
ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf
#ENV OTEL_EXPORTER_OTLP_ENDPOINT="https://webhook.site/ddd1f40d-e3f7-4178-93e2-5f35760feaca"
ENV OTEL_EXPORTER_OTLP_ENDPOINT=https://otel.kloudmate.com:4318
ENV OTEL_EXPORTER_OTLP_HEADERS="Authorization=sk_iUh"

# Run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
