# Dockerfiles for Roc Toolkit

[![build](https://github.com/roc-streaming/dockerfiles/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/roc-streaming/dockerfiles/actions/workflows/build.yml)

This repo provides dockerfiles for CI builds and end-user images for cross-compilation.

Docker images are built using Github Actions and then pushed to Docker Hub. The corresponding Docker Hub organization is [rocstreaming](https://hub.docker.com/u/rocstreaming).

Documentation for this process is [available here](https://roc-streaming.org/toolkit/docs/development/continuous_integration.html).

To build image(s) locally, run:

```
./make.sh [OPTIONS...] IMAGE[:TAG]...
```

For example (build all tags of `env-ubuntu`):

```
./make.sh env-ubuntu
```

Or (build all tags of `env-fedora` and two specific tags of `env-ubuntu`):

```
./make.sh env-fedora env-ubuntu:20.04 env-ubuntu:22.04
```

To build all images, run:

```
./make.sh [OPTIONS...]
```

Use `-n` flag to see what's going to happen without actually doing anything, for example:

```
./make.sh -n
```

For the full list of available options, run:

```
./make.sh --help
```
