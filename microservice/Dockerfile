FROM kong:latest

USER root

RUN apt-get update && apt-get install -y curl

USER kong

COPY kong.yml /usr/local/kong/declarative/kong.yml