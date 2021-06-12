#!/usr/bin/env bash
# Update system configurations if needed

# sed -i".bak" "s/worker_connections\s*1024/worker_connections 32768/g" /etc/nginx/nginx.conf

# NOTE: will need to restart nginx.service in 99-restart-services
