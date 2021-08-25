ARG ALPINE_VERSION=3.13
ARG AWS_CDK_VERSION=1.119.0
FROM alpine:${ALPINE_VERSION}

RUN apk update && \
    apk upgrade && \
    apk --no-cache --update add \
        python3-dev \
        py3-pip \
        git \
        jq \
        nodejs \
        npm \
        python3 \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        wget \
        zip \
        git \
        && \
    update-ca-certificates && \
    npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

# Allow for caching python modules
VOLUME ["/usr/lib/python3.8/site-packages/"]

WORKDIR /opt/app

CMD ["cdk", "--version"]
