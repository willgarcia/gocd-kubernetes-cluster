FROM delitescere/jdk:8

ARG GOCD_VERSION=
ARG GOCD_DOWNLOAD_URL=
ARG GOCD_DOWNLOAD_SHA256=
ARG DOCKER_DOWNLOAD_URL=
ARG DOCKER_DOWNLOAD_SHA256=
ARG DOCKER_COMPOSE_DOWNLOAD_URL=
ARG DOCKER_COMPOSE_DOWNLOAD_SHA256=
ENV GOCD_HOME=/opt/go-agent \
    PATH=$GOCD_HOME:$PATH
LABEL version="$GOCD_VERSION" name="gocd.client"


RUN apk upgrade --update \
    && apk add --no-cache --update git bash

RUN set -ex \
    && mkdir -p /opt /var/log/go-agent /var/run/go-agent \
    && cd /opt \
    && wget ${GOCD_DOWNLOAD_URL}/${GOCD_VERSION}/generic/go-agent-${GOCD_VERSION}.zip -O go-agent.zip\
    && sha256sum go-agent.zip | grep "${GOCD_DOWNLOAD_SHA256}  go-agent.zip" \
    && unzip go-agent.zip \
    && rm go-agent.zip \
    && mv go-agent-* ${GOCD_HOME} \
    && chmod 774 ${GOCD_HOME}/*.sh \
    && mkdir -p ${GOCD_HOME}/work \
    && echo `hostname` > /opt/go-agent/config/guid.txt \
    && chmod 755 /opt/go-agent/agent.sh

RUN echo wget ${DOCKER_COMPOSE_DOWNLOAD_URL} -O /usr/local/bin/docker-compose\
    && echo wget ${DOCKER_DOWNLOAD_URL} -O /tmp/docker.tgz

RUN set -ex \
    && wget ${DOCKER_COMPOSE_DOWNLOAD_URL} -O /usr/local/bin/docker-compose \
    && sha256sum /usr/local/bin/docker-compose | grep "$DOCKER_COMPOSE_DOWNLOAD_SHA256  /usr/local/bin/docker-compose" \
    && chmod +x /usr/local/bin/docker-compose \
    && wget ${DOCKER_DOWNLOAD_URL} -O /tmp/docker.tgz \
    && sha256sum /tmp/docker.tgz | grep "$DOCKER_DOWNLOAD_SHA256  /tmp/docker.tgz" \
    && tar -xzf /tmp/docker.tgz -C /tmp \
    && mv /tmp/docker/docker /usr/local/bin/ \
    && rm /tmp/docker.tgz

RUN rm -rf /tmp/* /var/cache/apk/* \
    && apk del build-dependencies

COPY ./files/ /

CMD ["/opt/go-agent/agent.sh"]
