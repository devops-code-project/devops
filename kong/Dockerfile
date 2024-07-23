# Dockerfile for custom Kong image
FROM kong:latest

USER root

RUN apt-get update && apt-get install -y curl

COPY kong.yml /usr/local/kong/declarative/kong.yml

USER kong

CMD kong start \
  && curl -i -X POST http://localhost:8001/consumers --data "username=my_consumer" \
  && curl -i -X POST http://localhost:8001/consumers/my_consumer/jwt --data "algorithm=HS384" --data "key=your-key" --data "secret=roITo2yN5V8W6RbcVJ0GvjKjFbfNgs2DRirmwdpbBTQ48mSudfltuMGxmUCIjYZOIUeBSZqMUcdNRXhYgY8w=="
