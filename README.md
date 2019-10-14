# Continuous Deployment for Node with docker-compose

This image packs what is typically necessary for deploying services using node and adds `docker compose` for e2e and integration tests.

**Limitations**: The `docker-compose.yml` can't mount volumes. Since we'll be using a `docker-in-docker` approach, i.e. running `docker-compose` inside a docker container, the `DOCKER_HOST` of the inner container is the same of the most outter container. In other words, when assembling the volumes of your `docker-compose`, `Docker` will look for directories on the host machine, not in the container.

## Example Circle CI configuration

```yaml
version: 2
jobs:
  integration-tests:
    docker:
      - image: escaletech/node-with-docker-compose
    steps:
      - checkout
      - setup_remote_docker
      - attach_workspace:
          at: /tmp/workspace
      - run: docker-compose up test_ci
```
