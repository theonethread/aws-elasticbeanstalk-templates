#!/usr/bin/env bash
# Restart system services here after all postdeploy hook changes

# systemctl daemon-reload

systemctl restart web.service
# systemctl restart nginx.service
