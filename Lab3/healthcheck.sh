#!/bin/bash

# Define the services to check
SERVICES=("nginx" "mysql" "tomcat" "jboss")

# Email settings
EMAIL="monitoringteam@example.com"
SUBJECT="Service Alert: One or more services are down"
BODY="The following services are down:"

# Check the status of each service
for SERVICE in "${SERVICES[@]}"; do
    if ! systemctl is-active --quiet "$SERVICE"; then
        BODY="$BODY\n$SERVICE"
    fi
done

# Send an email if any service is down
if [ "$BODY" != "The following services are down:" ]; then
    echo -e "$BODY" | mail -s "$SUBJECT" "$EMAIL"
fi
