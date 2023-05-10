FROM registry.gitlab.com/bockiii/deemix-docker:latest@sha256:d325660d833c30c8bbb5cf0caa75135b42a2f69b82f2269fd5bea91a04c449e6 as deemix

LABEL maintainer="pete"

ENV DEEMIX_SINGLE_USER=true
ENV AUTOCONFIG=true
ENV PUID=1000
ENV PGID=1000

# deemix
COPY --from=deemix /deemix-server /deemix-server
RUN chmod +x /deemix-server
VOLUME ["/config_deemix", "/downloads"]
EXPOSE 6995

COPY root /
RUN chmod +x /etc/services.d/*/run
VOLUME ["/config"]
EXPOSE 6995
