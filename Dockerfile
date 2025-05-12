# Use the official Tomcat base image
FROM tomcat:9.0
# Copy your WAR file into the Tomcat webapps directory
COPY ./target/WebAppCal-0.0.6.war /usr/local/tomcat/webapps/
# Expose port 8080 inside the container
EXPOSE 8080
# Command to run the Tomcat server
CMD ["catalina.sh", "run"]
