FROM delitescere/jdk:8

ARG GOCD_VERSION=
ARG GOCD_DOWNLOAD_URL=
ARG GOCD_DOWNLOAD_SHA256=

LABEL version="$GOCD_VERSION" name="gocd.server"

RUN apk upgrade --update \
    && apk --no-cache add git bash

RUN mkdir -p /config/default /config/db /config/addons /config/plugins /artifacts /logs /var/lib/go-server/plugins /tmp \
    && ln -sf /artifacts /var/lib/go-server/artifacts \
    && ln -sf /config /etc/go \
    && ln -sf /config /var/lib/go-server/config \
    && ln -sf /config/addons /var/lib/go-server/addons \
    && ln -sf /config/db /var/lib/go-server/db \
    && ln -sf /config/plugins /var/lib/go-server/plugins/external \
    && ln -sf /logs /var/log/go-server

VOLUME ["/config"]

EXPOSE 8153 8154

COPY ./files/* /

WORKDIR /

RUN set -ex \
    && wget $GOCD_DOWNLOAD_URL/$GOCD_VERSION/generic/go-server-$GOCD_VERSION.zip -O go-server.zip \
    && sha256sum go-server.zip | grep "$GOCD_DOWNLOAD_SHA256  go-server.zip" \
    && unzip go-server.zip \
    && mv ./go-server-* ./go-server \
    && chmod 755 /start

RUN rm -rf /go-server.zip go-server-* /var/tmp/* /go-server/init.* /go-server/server.cmd /go-server/*.bat /go-server/*.sh /go-server/default.* /go-server/defaultFiles \
    && rm -rf /tmp/* /var/cache/apk/* \
    && apk del build-dependencies

CMD ["/start"]
