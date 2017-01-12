FROM google/cadvisor:latest

ENV USERNAME=admin
ENV PASSWORD=Password1
ENV PORT=8080

RUN apk add --update apache2-utils \
    && rm -rf /var/cache/apk/*

RUN htpasswd -c -i -b auth.htpasswd ${USERNAME} ${PASSWORD}

EXPOSE ${PORT}
ENTRYPOINT ["/usr/bin/cadvisor", "--http_auth_file", "auth.htpasswd", "--http_auth_realm", "localhost"]
