# ------------------------------------------------------------------------------
# Thanks to https://github.com/sspreitzer/docker-shellinabox
# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:bionic
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

# ------------------------------------------------------------------------------
# Install shellinabox and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
openssl shellinabox sudo openssh-client screen dtach tmux \
wget ca-certificates bash-completion locales && \
sed -e 's/# en_US.UTF-8/en_US.UTF-8/' -i /etc/locale.gen && locale-gen && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Install startup script with dockerwait
# https://github.com/Fullaxx/dockerwait
COPY app.sh dockerwait.static /app/

# ------------------------------------------------------------------------------
# Add volumes
VOLUME /home/
VOLUME /var/lib/shellinabox/

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 4200

# ------------------------------------------------------------------------------
# Define runtime command
CMD ["/app/app.sh"]
