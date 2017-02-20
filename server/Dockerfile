FROM delitescere/jdk:latest

ARG GO_VERSION=17.1.0-4511
ARG DOWNLOAD_URL=https://download.gocd.io/binaries

RUN apk upgrade --update && \
    apk --no-cache add git bash

RUN mkdir -p /config/default /config/db /config/addons /config/plugins /artifacts /logs /var/lib/go-server/plugins /tmp && \
  ln -sf /artifacts /var/lib/go-server/artifacts && \
  ln -sf /config /etc/go && \
  ln -sf /config /var/lib/go-server/config && \
  ln -sf /config/addons /var/lib/go-server/addons && \
  ln -sf /config/db /var/lib/go-server/db && \
  ln -sf /config/plugins /var/lib/go-server/plugins/external && \
  ln -sf /logs /var/log/go-server

VOLUME ["/config", "/artifacts", "/logs"]

EXPOSE 8153 8154

COPY ./files/* /

WORKDIR /
LABEL cd.go.version=$GO_VERSION cd.go.server=""
RUN echo "Installing GoCD ${GO_VERSION} (${DOWNLOAD_URL})" && wget $DOWNLOAD_URL/$GO_VERSION/generic/go-server-$GO_VERSION.zip -O go-server.zip && \
  unzip go-server.zip && \
  mv ./go-server-* ./go-server && \
  chmod 755 /start && \
  rm -rf go-server-* /var/tmp/* /go-server/init.* /go-server/server.cmd /go-server/*.bat /go-server/*.sh /go-server/default.* /go-server/defaultFiles

CMD ["/start"]