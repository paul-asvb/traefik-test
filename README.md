# Traefiks test

[Documentation](https://docs.traefik.io/)

```bash

docker run \
-p 8080:8080 \
-p 80:80 \
-p 443:443 \
-v $PWD/traefik.toml:/etc/traefik/traefik.toml \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /opt/traefik/acme.json:/acme.json \
--net fastnetwork \
traefik

```

```bash

docker run \
-p 9000:80 \
--net fastnetwork \
-l traefik.docker.network=fastnetwork \
-l traefik.enable=true \
-l traefik.basic.frontend.rule=Host:pfaulk.de \
-l traefik.basic.port=9000 \
-l traefik.basic.protocol=https \
--name html \
nginx

```

  - "traefik.docker.network=web"
      - "traefik.enable=true"
      - "traefik.basic.frontend.rule=Host:app.my-awesome-app.org"
      - "traefik.basic.port=9000"
      - "traefik.basic.protocol=http"
      - "traefik.admin.frontend.rule=Host:admin-app.my-awesome-app.org"
      - "traefik.admin.protocol=https"
      - "traefik.admin.port=9443"