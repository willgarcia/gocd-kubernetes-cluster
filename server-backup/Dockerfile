FROM alpine:3.5

LABEL version=1.0 name="gocd.backup"

RUN apk upgrade --update \
    && apk --no-cache add curl bash

COPY files/ /
RUN chmod -R +x /etc/periodic/daily/gocd-backup

CMD ["crond", "-f", "-d", "8"]
