FROM docker:1.12-dind

ENV DOCKER_CONTENT_TRUST=1

COPY ./files/ /

RUN chmod 755 /start
CMD /start
