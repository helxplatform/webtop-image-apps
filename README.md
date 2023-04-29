## Introduction

This project creates a docker image based on the [linuxserver/webtop](https://docs.linuxserver.io/images/docker-webtop) image that is meant to run within our HeLx platofrm.  It also adds a few image manipulation applications (ImageJ, Napari).

## Configuring

Some configuration variables can be set in the "config.env" file.  There are others to set the image tag and registry.  Also some to use when running the container locally.  "run.env" can be used to set variables within the container when running.

## Building

To build the image you can use the basic docker command or use the included Makefile.
```
  make build
```
  To build the image without using the docker cache you can use the 'build-nc' argument.

## Running Locally

```
  make run
```
  Then connect to localhost:8888 in your web browser.

## Publishing Image to Registry
  To push the image to the configured registry (in config.env) use the 'publish' argument.
```
  make publish
```
  To build the image without the docker cache and publish you can use the 'release' argument.

## Container Environment Variables
To set the UID, GID, and username that is switched to for the Web UI the PUID, PGID and USER environment variables can be used.
