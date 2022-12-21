#!/bin/bash

# Generate htaccess file
echo "Generating auth.htpasswd file..."
htpasswd -c -i -b auth.htpasswd ${USERNAME} ${PASSWORD}

# Start
echo "Starting cAdvisor..."
/usr/bin/cadvisor --http_auth_file auth.htpasswd --http_auth_realm localhost