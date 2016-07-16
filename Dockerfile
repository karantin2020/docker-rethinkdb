#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM ubuntu:xenial

# Install RethinkDB.
RUN \
  apt-get update && apt-get -y upgrade && \
  echo "deb http://download.rethinkdb.com/apt xenial main" | tee /etc/apt/sources.list.d/rethinkdb.list && \
  apt-get install -y wget && \
  wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get -y install rethinkdb && \
  \
  cp /etc/rethinkdb/default.conf.sample /etc/rethinkdb/instances.d/instance1.conf && \
  \
  apt-get purge -y wget && \
  apt-get clean && apt-get autoclean && apt-get -y autoremove

# Define working directory.
WORKDIR /home/data

# Define default command.
CMD ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
