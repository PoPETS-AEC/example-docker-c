# Let's start from an official debian docker image - feel free to update the tag
# as needed.
FROM debian:13.0
ENV DEBIAN_FRONTEND=noninteractive
# Install packages here
RUN apt-get update && apt-get -y install --no-install-recommends adduser \
  build-essential gcc gdb valgrind && \
  apt-get clean autoclean && \
  apt-get autoremove

# Create group and user to avoid permissions issues with local user/group
# when editing files in and out of docker container.
# Note: GNU/Linux systems assign the default 1000 User Identifier (UID) and
# Group Identifier (GID) to the first account created during installation. It is
# possible that your local UID and GID on your machine may be different, in that
# case you should edit the values in the commands below.
# You can see your UID and GID(s) by executing: `id`
RUN addgroup --gid 1000 groupname
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 username
ENV HOME=/home/username
USER username