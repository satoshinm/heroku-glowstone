#!/bin/bash

# Create server config
echo "server-port=25566" > /app/server.properties

# Sync initial files
ruby bin/sync.rb init

# Print logs to STDOUT
touch server.log
nice tail -f server.log &

# Run glowstone
java -Xmx1024M -Xms1024M -jar vendor/glowstone.jar
