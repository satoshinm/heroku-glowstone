#!/bin/bash

export GS_HEROKU_SERVER_PORT=${PORT}
foreman start -f Procfile-web
