#!/bin/bash

# Docker entrypoint script
# Executes original command

# Summary:
# --------
# * Set up script
# * Start services
# * Execute command

# Set up script
set -e
set -o pipefail


# Start services
rsyslogd
service dnsmasq start


# Execute command
if [[ $@ ]]
then
    exec "$@"
else
    tail -fn 0 /var/log/syslog | grep dnsmasq
fi
