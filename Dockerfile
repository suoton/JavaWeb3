# Use the official OpenJDK image as a base
FROM openjdk:21-jre-slim

# Set the working directory
WORKDIR /app

# Copy the application JAR file into the container
COPY target/JavaWeb3.jar app.jar

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
