# cdk-image

##### Docker

![Docker Pulls](https://img.shields.io/docker/pulls/theidledeveloper/cdk-image)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/theidledeveloper/cdk-image)
![Docker Stars](https://img.shields.io/docker/stars/theidledeveloper/cdk-image)

##### Repository

![Latest tag](https://img.shields.io/github/v/tag/theidledeveloper/cdk-image?label=Latest%20Tag) ![License](https://img.shields.io/github/license/theidledeveloper/cdk-image)

[Repository URL](https://github.com/theidledeveloper/cdk-image)

##### Build Status

![Release Check Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/cdk-image/check_new_release.yml?label=Release%20Check%20Build)

![Latest Alpine Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/cdk-image/build_image_alpine.yml?label=Latest%20Alpine%20Image%20Build)
![Latest Debian Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/cdk-image/build_image_debian.yml?label=Latest%20Debian%20Image%20Build)

![Nightly Alpine Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/cdk-image/build_image_alpine_nightly.yml?label=Nightly%20Alpine%20Image%20Build)
![Nightly Debian Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/cdk-image/build_image_debian_nightly.yml?label=Nightly%20Debian%20Image%20Build)

A minimal set of alpine and debian linux container with the AWS CDK installed via npm
[npm aws-cdk](https://www.npmjs.com/package/aws-cdk) [aws-cdk](https://github.com/aws/aws-cdk)

### Images

Each image is created using one of either the [node Alpine or Debian images](https://hub.docker.com/_/node) for each of
the supported OS releases and version of NPM (as seen below) and for both `amd/64` and `arm/64` architectures.

To run the images against different platforms, use the `--platform` switch when evoking your container runtime:

```bash
# amd64
docker run --platform linux/amd64 theidledeveloper/cdk-image:2.92.0-20-bookworm /bin/sh -c "aws --version"
# arm64
docker run --platform linux/arm64 theidledeveloper/cdk-image:2.92.0-20-bookworm /bin/sh -c "aws --version"
```

### Release Versions

Versioned released are created when a new version is tagged in [aws/aws-cdk/tags](https://github.com/aws/aws-cdk/tags).

### Nightly Images

Nightly builds are created from the latest npm version at [npmjs/aws-cdk](https://www.npmjs.com/package/aws-cdk) for
each alpine, debian and node version listed below.

### Build Locally

The image makes use of *ARG* instructions to allow the use of a single [Dockerfile alpine](./Dockerfile.alpine) or
[Dockerfile debian](./Dockerfile.debian) but build images with different base image versions of aws-cdk. To properly
supply the image ARGs pass in `ALPINE_VERSION` or `DEBIAN_VERSION` and `CDK_VERSION` using the `--build-arg` flag.
The base images can be found at [node dockerhub](https://hub.docker.com/_/node).

To build an alpine *3.18+*, latest node version and aws-cdk version *2.90.0* use below:

```bash
docker build --build-arg ALPINE_VERSION=alpine3.18 --build-arg CDK_VERSION=2.90.0 -t cdk-image:2.90.0-alpine -f Dockerfile.alpine .
```

To build a debian *bookworm*, latest node version, slim image and aws-cdk version *2.90.0* use below:

```bash
docker build --build-arg DEBIAN_VERSION=bookworm-slim --build-arg CDK_VERSION=2.90.0 -t cdk-image:2.90.0-debian -f Dockerfile.debian .
```
