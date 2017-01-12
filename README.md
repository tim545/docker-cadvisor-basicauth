# docker-cadvisor-basicauth

[cAdvisor](https://github.com/google/cadvisor) wrapped in a container with basic auth enabled

### Running the container

Use the command below, making sure you replace `<my-username>` and `<my-password>` with your own values (remove the `<>` as well).

`docker run --name="cadvisor-basicauth" -e USERNAME=<my-username> -e PASSWORD=<my-password> --build-arg tim545/cadvisor-basicauth:latest`

The container accepts three arguments:

| Argument | Description | Default |
| --- | --- | --- |
| **USERNAME** | basic auth username | `admin` |
| **PASSWORD** | basic auth password | `Password1` |
| **PORT** | port the container will run on | `8080` |
