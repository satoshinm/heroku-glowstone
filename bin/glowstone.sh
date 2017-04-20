#!/bin/bash

# Create server config
mkdir -p /app/config
echo "server:" > /app/config/glowstone.yml
echo "    port: 25566" >> /app/config/glowstone.yml
echo "    online-mode: false" >> /app/config/glowstone.yml
echo "world:" >> /app/config/glowstone.yml
echo "    seed: '1'" >> /app/config/glowstone.yml

# Install plugins
mkdir -p /app/plugins
cp vendor/plugins/* /app/plugins
echo Installed plugins:
ls -l vendor/plugins/

mkdir -p /app/plugins/WebSandboxMC
echo "http:" > /app/plugins/WebSandboxMC/config.yml
echo "  port: $GS_HEROKU_SERVER_PORT" >> /app/plugins/WebSandboxMC/config.yml
echo "mc:" >> /app/plugins/WebSandboxMC/config.yml
echo "  x_center: -451" >> /app/plugins/WebSandboxMC/config.yml
echo "  y_center: 80" >> /app/plugins/WebSandboxMC/config.yml
echo "  z_center: -325" >> /app/plugins/WebSandboxMC/config.yml


# Sync initial files
ruby bin/sync.rb init

# Print logs to STDOUT
touch server.log
nice tail -f server.log &

# Run glowstone
java -Xmx512M -Xms512M -jar vendor/glowstone.jar
