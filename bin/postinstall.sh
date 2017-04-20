#!/bin/bash

# Download Glowstone
curl -o vendor/glowstone.jar "https://bamboo.gserv.me/artifact/GSPP-SRV/shared/build-latestSuccessful/Version-Independent-Server-JAR/glowstone.jar"

# Download plugins
mkdir -p vendor/plugins
curl -Lo vendor/plugins/WebSandboxMC.jar `curl -s https://api.github.com/repos/satoshinm/WebSandboxMC/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4`

