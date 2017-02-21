FROM delitescere/jdk:8

ARG GOCD_VERSION=17.1.0
ARG GOCD_REVISION=4511

ENV GOCD_RELEASE=go-agent \
    GOCD_HOME=/opt/go-agent \
    PATH=$GOCD_HOME:$PATH
ENV GOCD_RELEASE_ARCHIVE=${GOCD_RELEASE}-${GOCD_VERSION}-${GOCD_REVISION}.zip \
    GOCD_REPO=https://download.go.cd/binaries/${GOCD_VERSION}-${GOCD_REVISION}/generic

LABEL version="$GOCD_VERSION" name="gocd.client"
RUN apk upgrade --update \
    && apk add --no-cache --update git curl bash openssh ca-certificates \
    && mkdir -p /opt /var/log/go-agent /var/run/go-agent \
    && cd /opt \
    && curl -sSL ${GOCD_REPO}/${GOCD_RELEASE_ARCHIVE} -O \
    && unzip ${GOCD_RELEASE_ARCHIVE} \
    && rm ${GOCD_RELEASE_ARCHIVE} \
    && mv /opt/${GOCD_RELEASE}-${GOCD_VERSION} ${GOCD_HOME} \
    && chmod 774 ${GOCD_HOME}/*.sh \
    && mkdir -p ${GOCD_HOME}/work \
    && echo `hostname` > /opt/go-agent/config/guid.txt \
    && chmod 755 /opt/go-agent/agent.sh

RUN curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && wget https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz -O /tmp/docker.tgz \
    && tar -xzf /tmp/docker.tgz -C /tmp \
    && mv /tmp/docker/docker /usr/local/bin/

RUN rm -rf /tmp/* /var/cache/apk/* \
    && apk del ca-certificates openssl wget

COPY ./files/ /

CMD ["/opt/go-agent/agent.sh"]
