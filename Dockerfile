# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0.55-jdk8-openjdk-slim

# Remove the default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the .war file to the webapps directory
COPY surveyForm.war /usr/local/tomcat/webapps/ROOT.war

# Set the default command to start Tomcat	
CMD ["catalina.sh", "run"]