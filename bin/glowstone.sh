#!/bin/bash

# Create server config
mkdir -p /app/config
echo "server:" > /app/config/glowstone.yml
echo "    port: 25566" >> /app/config/glowstone.yml
echo "    online-mode: false" >> /app/config/glowstone.yml

# Sync initial files
ruby bin/sync.rb init

# Print logs to STDOUT
touch server.log
nice tail -f server.log &

# Run glowstone
java -Xmx1024M -Xms1024M -jar vendor/glowstone.jar
