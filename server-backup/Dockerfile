FROM alpine:latest

RUN apk upgrade --update && \
    apk --no-cache add curl bash

COPY files/ /
RUN chmod -R +x /etc/periodic/daily/gocd-backup

CMD ["crond", "-f", "-d", "8"]
