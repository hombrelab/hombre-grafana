# hombre-grafana
![Docker Pulls](https://img.shields.io/docker/pulls/hombrelab/hombre-grafana) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/hombrelab/hombre-grafana) ![GitHub commit activity](https://img.shields.io/github/last-commit/hombrelab/hombre-grafana)

The [hombre-grafana](https://hub.docker.com/repository/docker/hombrelab/hombre-grafana) image is based on the [official Grafana v7.3.6 image](https://hub.docker.com/r/grafana/grafana).  
The image is used to create my own [@Hombrelab](me@hombrelab.com) Grafana Docker image with a few plugins already added.  

Includes:
- linux packages: bash, nano, ca-certificates. 

Deployment examples:

Command line
```shell script
docker run \
    --name grafana \
    --detach \
    --restart unless-stopped \
    --volume/etc/localtime:/etc/localtime:ro \
    --publish 3000:3000 \
    hombrelab/hombre-grafana
```
Docker Compose
```yaml
    grafana:
        container_name: grafana
        restart: unless-stopped
        image: hombrelab/hombre-grafana
        volumes:
            - /etc/localtime:/etc/localtime:ro
        ports:
            - 3000:3000
```