FROM docker:1-dind

LABEL version=1 name=dind
ENV DOCKER_CONTENT_TRUST=1
COPY ./files/ /
RUN chmod 755 /start

CMD ["/start"]
