# docker-cadvisor-basicauth

[cAdvisor](https://github.com/google/cadvisor) wrapped in a container with basic auth enabled

### Running the container

Use the command below, making sure you replace `<my-username>` and `<my-password>` with your own values (remove the `<>` as well).

```
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor-basicauth \
  --restart=always \
 cadvisor-basicauth:latest
```

The container accepts three arguments:

| Argument | Description | Default |
| --- | --- | --- |
| **USERNAME** | basic auth username | `admin` |
| **PASSWORD** | basic auth password | `Password1` |
| **PORT** | port the container will run on | `8080` |
