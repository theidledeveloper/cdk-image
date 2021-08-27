# CDK Image

Build image for CDK

## Build

```bash
VERSION="1.120.0"; docker build -t aws_cdk:"${VERSION}" --build-arg AWS_CDK_VERSION="${VERSION}" .
```

## Run

```bash
VERSION="1.120.0"
docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --volume "${HOME}/.aws":/root/.aws --entrypoint=/bin/bash "aws_cdk:${VERSION}"
```

## Pulling Image

The image is stored in Github and can be pulled using

```bash
docker pull ghcr.io/theidledeveloper/cdk-docker:latest
```

## GitHub token permissions

Pushing to GitHub container registry requires the following permissions:

* `read:packages` scope to download container images and read their metadata.
* `write:packages` scope to download and upload container images and read and write their metadata.
* `delete:packages` scope to delete container images.
