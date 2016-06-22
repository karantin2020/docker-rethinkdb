## RethinkDB Dockerfile


This repository contains **Dockerfile** of [RethinkDB](http://www.rethinkdb.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/rethinkdb/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/rethinkdb/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull node3030/rethinkdb`

   (alternatively, you can build an image from Dockerfile: `docker build -t="node3030/rethinkdb" github.com/karantin2020/rethinkdb`)


### Usage

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 node3030/rethinkdb

#### Run the first host of cluster

    docker run -d -h `hostname` -p 8080:8080 -p 28015:28015 -p 29015:29015 -v <data-dir>:/data node3030/rethinkdb rethinkdb -d /data --bind all --canonical-address `curl icanhazip.com`

#### Run subsequent hosts joining to cluster

    docker run -d -h `hostname` -p 8080:8080 -p 28015:28015 -p 29015:29015 -v <data-dir>:/data node3030/rethinkdb rethinkdb -d /data --bind all --canonical-address `curl icanhazip.com` -j <first-host-ip>:29015

After few seconds, Open `http://<host>:8080`.
