FROM hashicorp/tfc-agent:1.0.2

USER root

# Install sudo. The container runs as a non-root user, but people may rely on
# the ability to apt-get install things.
RUN apt-get -y install sudo

# Permit tfc-agent to use sudo apt-get commands.
RUN echo 'tfc-agent ALL=NOPASSWD: /usr/bin/apt-get , /usr/bin/apt' >> /etc/sudoers.d/50-tfc-agent

USER tfc-agent

RUN sudo apt update
RUN sudo apt-get --assume-yes install ansible