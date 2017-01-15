# docker-cadvisor-basicauth

[cAdvisor](https://github.com/google/cadvisor) wrapped in a container with basic auth enabled

### Running the container

The container can be run without any configuration but to set your own username and password you will need to build the image locally.

`git clone https://github.com/tim545/docker-cadvisor-basicauth`

`cd docker-cadvisor-basicauth/`

`docker build --build-arg USERNAME=admin --build-arg PASSWORD=Password1 -t tim545/cadvisor-basicauth .`

Note the `--build-arg` parameters, you can set those as any username and password values. The image accepts three build time arguments in total:

| Argument | Description | Default |
| --- | --- | --- |
| **USERNAME** | basic auth username | admin |
| **PASSWORD** | basic auth password | Password1 |
| **PORT** | port the container will run on | 8080 |

To run your image use the command below. This command can be run without the steps above but your settings will be the default which is too insecure for any production environment.

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
 tim545/cadvisor-basicauth:latest
```

