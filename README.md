# docker-cadvisor-basicauth

[cAdvisor](https://github.com/google/cadvisor) wrapped in a container with basic auth enabled.

## Running the container

The container can be run without any configuration but to set your own username and password you will need to build the image locally as the username and password are set at build time.

First, using a CLI, install a local copy to the machine you want to serve cAdvisor from:

`git clone https://github.com/tim545/docker-cadvisor-basicauth`

`cd docker-cadvisor-basicauth/`

Build the image using the Docker `build` command:

`docker build --build-arg USERNAME=admin --build-arg PASSWORD=Password1 -t tim545/cadvisor-basicauth .`

_Take note of the `--build-arg` parameters, you can set those as any username and password values you want._

To run your container use the `run` command:

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

_Note: This command can be run without the steps above, however your username, password and port settings will be the default values, which is ok for testing but too insecure for any production environment._

## Build Parameters

The image accepts three build time arguments in total:

| Argument | Description | Default |
| --- | --- | --- |
| **USERNAME** | basic auth username | admin |
| **PASSWORD** | basic auth password | Password1 |
| **PORT** | port the container will run on | 8080 |

They are used by adding the `--build-arg` option to the Docker `build command`, check the Docker documentation for more info about building an image locally.

## Known Issues/Limitations

- It's possible this project could be improved to allow the build parameters to be parsed directly into the run command, however for now it must be built locally to set custom auth settings.
- The characters accepted for the build parameters (e.g. password) may be limited by any potential keywords used by the Docker command or CLI.
- If you forget or want to change your password you will have to delete and rebuild your container.

## Contributing

Please feel free to raise an Issue or send me a PR

## @Mentions

I started this project after reading the comments from @exetico and @vmarmol on this [Issue](https://github.com/google/cadvisor/issues/784#issuecomment-279984056)
