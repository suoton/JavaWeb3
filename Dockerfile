FROM maven:3.9.0-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/WebAppCal-0.0.6.war /app/app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.war"]
