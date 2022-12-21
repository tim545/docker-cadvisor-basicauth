# docker-cadvisor-basicauth

Forked from [tim545/docker-cadvisor-basicauth](https://github.com/tim545/docker-cadvisor-basicauth) with added feature to allow passing `USERNAME` and `PASSWORD` as environment variables.

[cAdvisor](https://github.com/google/cadvisor) wrapped in a container with basic auth enabled.

## Running the container

To run your container use the `run` command:

```
docker run \
  --env USERNAME=foo \
  --env PASSWORD=bar \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor-basicauth \
  --restart=always \
 jeliasson/cadvisor-basicauth:latest
```