FROM google/cadvisor:latest

ENV USERNAME=admin
ENV PASSWORD=Password1
ENV PORT=8080

RUN htpasswd -c -i -b auth.htpasswd ${USERNAME} ${PASSWORD}

ADD auth.htpasswd /auth.htpasswd

EXPOSE ${PORT}
ENTRYPOINT ["/usr/bin/cadvisor", "--http_auth_file", "auth.htpasswd", "--http_auth_realm", "localhost"]
