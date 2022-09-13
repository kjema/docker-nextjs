# Next.js & Docker

## Build

```bash
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f docker-compose.yml build --parallel
```

## Run

```bash
docker-compose -f docker-compose.yml up -d
```
