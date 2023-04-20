# Dockerfiles for Roc Toolkit

[![build](https://github.com/roc-streaming/dockerfiles/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/roc-streaming/dockerfiles/actions/workflows/build.yml)

This repo provides dockerfiles for CI builds and end-user images for cross-compilation.

Docker images are built using Github Actions and then pushed to Docker Hub. The corresponding Docker Hub organization is [rocstreaming](https://hub.docker.com/u/rocstreaming).

Documentation for this process is [available here](https://roc-streaming.org/toolkit/docs/development/continuous_integration.html).

To build image locally, run:

```
./make.sh images/<image_name>
```
