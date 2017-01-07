FROM svenv/base
MAINTAINER Sven van de Scheur <svenvandescheur@gmail.com>

# Install required packages
RUN apt-get update && apt-get install -y \
  dnsmasq

# Add files
ADD files /

# Download latest hostsfile
RUN wget -O /srv/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# Volumes
VOLUME /var/log/

# Expose
EXPOSE 53 53/udp

# Set entrypoint file
ENTRYPOINT ["/entrypoint.sh"]