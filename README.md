# CDK Image

Build image for CDK

## Build

```bash
VERSION="1.119.0"; docker build -t aws_cdk:"${VERSION}" --build-arg AWS_CDK_VERSION="${VERSION}" .
```

## Run

```bash
VERSION="1.119.0"
docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --volume "${HOME}/.aws":/root/.aws --entrypoint=/bin/bash "aws_cdk:${VERSION}"
```
