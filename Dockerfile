# Dockerfile: hombre-grafana

FROM grafana/grafana:7.0.0

USER root

ARG version

ENV GF_PATHS_PLUGINS="/var/lib/grafana-plugins"

LABEL version="${version}"
LABEL description="Customized InfluxDB Docker image"
LABEL maintainer="Hombrelab <me@hombrelab.com>"
LABEL inspiration="getting things done my way"

RUN apk add --no-cache \
    bash \
    nano \
    git \
    build-base

RUN mkdir -p "$GF_PATHS_PLUGINS" && \
    chown -R grafana:grafana "$GF_PATHS_PLUGINS"

USER grafana

#ARG GF_INSTALL_PLUGINS="grafana-clock-panel \
#	,grafana-piechart-panel \
#	,savantly-heatmap-panel \
#	,mtanda-histogram-panel \
#	,ryantxu-ajax-panel \
#	,digiapulssi-breadcrumb-panel \
#	,vonage-status-panel \
#	,marcuscalidus-svg-panel \
#	,aidanmountford-html-panel \
#	,mxswat-separator-panel \
#	,simpod-json-datasource \
#	,paytm-kapacitor-datasource"
#
#RUN if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then \
#        OLDIFS=$IFS; \
#            IFS=','; \
#        for plugin in ${GF_INSTALL_PLUGINS}; do \
#            IFS=$OLDIFS; \
#            grafana-cli --pluginsDir "$GF_PATHS_PLUGINS" plugins install ${plugin}; \
#        done; \
#    fi