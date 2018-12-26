https-portal:
  image: steveltn/https-portal:1
  ports:
  - '80:80'
  - '443:443'
  restart: always
  environment:
    DOMAINS: 'pfaulk.de -> http://nginx:8080'
    STAGE: 'production'
nginx:
  ports:
  - '8080:80'
  image: nginx
  
  
docker run --net fastnetwork -p 8080:80 -d nginx
docker run --net fastnetwork -e DOMAINS="pfaulk.de -> http://nginx:8080" -e STAGE="production" -p 80:80 -p 443:443 steveltn/https-portal:1
