FROM eclipse-temurin:8-jdk-alpine

# Install bash only if needed; ash is already available
RUN apk update && apk add --no-cache bash

# Create app directory
ENV PROJECT_HOME=/opt/app
RUN mkdir -p ${PROJECT_HOME}

# Copy jar file
COPY target/spring-boot-mongo-1.0.jar ${PROJECT_HOME}/spring-boot-mongo.jar

# Set working directory
WORKDIR ${PROJECT_HOME}

EXPOSE 8080

# Run the application
CMD ["java", "-jar", "spring-boot-mongo.jar"]
