#!/bin/bash

# Hostsfile update script
# Updates the hostsfile with known advertisement networks

# Summary:
# --------
# * Download latest hostsfile
# * Reload dnsmasq


# Download latest hostsfile
wget -O /srv/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# Reload dnsmasq
service dnsmasq force-reload
