# Traefiks test

[Documentation](https://docs.traefik.io/)

```bash

docker run \
-p 8080:8080 \
-p 80:80 \
-v $PWD/traefik.toml:/etc/traefik/traefik.toml \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /opt/traefik/acme.json:/acme.json \
--net fastnetwork \
traefik

```

```bash

docker run \
-d \
-p 8001:80 \
--net fastnetwork \
nginx

```