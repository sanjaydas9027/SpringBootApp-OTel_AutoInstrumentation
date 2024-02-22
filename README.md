# Sample Application with OTel Auto-Instrumentation

This is a sample application that utilizes OpenTelemetry (OTel) auto-instrumentation to seamlessly collect logs, traces, and metrics, and then send them to a specified endpoint.

## Installation Steps

### Install Docker

Make sure Docker is installed on your system. You can use the following commands for installation:

```bash
sudo apt update
sudo apt install docker.io
sudo su -
usermod -aG docker ubuntu
```

## Update Dockerfile

Update the Dockerfile with the necessary environment variables for OTel configuration. You can set the endpoint and, if applicable, provide authentication headers.

```bash
ENV OTEL_EXPORTER_OTLP_ENDPOINT="https://otel.kloudmate.dev:4318"
ENV OTEL_EXPORTER_OTLP_HEADERS="Authorization=<YOUR_SECRET_KEY>"

# If no authentication is required, use the endpoint only
# ENV OTEL_EXPORTER_OTLP_ENDPOINT="https://webhook.site/ddd1f40d-e3f7-4178-93e2-5f35760feaca"
```

## Docker Commands

Build the Docker image and run the container with the following commands:

```bash
docker build -t <imageName> .
docker run -p 8080:8080 <imageName>:<tag>
```

Replace `<imageName>` and `<tag>` with your desired image name and tag. The application will be accessible on `http://localhost:8080`.

![Project Screenshot](https://github.com/sanjaydas9027/OpenTelemetry-SpringBootApp/blob/master/Screenshot%20(1730).png)
![Project Screenshot](https://github.com/sanjaydas9027/OpenTelemetry-SpringBootApp/blob/master/Screenshot%20(1731).png)
![Project Screenshot](https://github.com/sanjaydas9027/OpenTelemetry-SpringBootApp/blob/master/Screenshot%20(1729).png)
![Project Screenshot](https://github.com/sanjaydas9027/OpenTelemetry-SpringBootApp/blob/master/Screenshot%20(1726).png)
![Project Screenshot](https://github.com/sanjaydas9027/OpenTelemetry-SpringBootApp/blob/master/Screenshot%20(1727).png)
![Project Screenshot]()
![Project Screenshot]()
![Project Screenshot]()
![Project Screenshot]()

