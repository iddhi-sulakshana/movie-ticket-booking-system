#!/bin/zsh
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH
# Define variables
PROJECT_DIR=$(pwd)
WAR_FILE="$PROJECT_DIR/target/TicketBookingSystem-1.0-SNAPSHOT.war"
TOMCAT_WEBAPPS_DIR="/opt/tomcat/webapps"
TOMCAT_SERVICE_LOCATION="/opt/tomcat/bin"

# Move to project directory
cd "$PROJECT_DIR"

# Clean and build the project
echo "Building the project with Maven..."
mvn clean package

# Check if the WAR file was created
if [ -f "$WAR_FILE" ]; then
    echo "WAR file created successfully."

    # Stop Tomcat
    echo "Stopping Tomcat service..."
    sudo "$TOMCAT_SERVICE_LOCATION"/shutdown.sh

    # Copy the WAR file to the Tomcat webapps directory
    echo "Copying WAR file to Tomcat webapps directory..."
    sudo cp "$WAR_FILE" "$TOMCAT_WEBAPPS_DIR"

    # wait for 1 seconds
    sleep 1

    # Start Tomcat
    echo "Starting Tomcat service..."
    sudo "$TOMCAT_SERVICE_LOCATION"/startup.sh

    echo "Deployment completed successfully."

    echo "Access the application at http://localhost:8080/TicketBookingSystem-1.0-SNAPSHOT"

else
    echo "WAR file not found. Build failed."
    exit 1
fi
