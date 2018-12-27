# Traefik test

[Documentation](https://docs.traefik.io/)

## Basic example

Basic example on commit 6ac4fe30a52020ff04999e7e57eea594a620db14 is working

## Test

create docker network

```bash
docker network create fastnetwork
```

Run script.
DANGER: !!Will delete all docker container!!

```bash
sh test.sh
```