FROM google/cadvisor:latest

ARG USERNAME=admin
ARG PASSWORD=Password1
ENV USERNAME=${USERNAME}
ENV PASSWORD=${PASSWORD}
ARG PORT=8080

RUN apk add --update apache2-utils \
    && rm -rf /var/cache/apk/*

COPY ./entry.sh /entry.sh

EXPOSE ${PORT}
ENTRYPOINT ["sh", "/entry.sh"]
