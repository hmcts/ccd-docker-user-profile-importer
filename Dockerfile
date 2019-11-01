FROM alpine:3.8

RUN apk add --no-cache postgresql-client curl jq && rm -rf /var/cache/apk/*

## Add the wait script to the image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait

COPY scripts /scripts
RUN ["chmod", "+x", "/wait"]

RUN chmod +x /scripts/*.sh

CMD "/wait" && "/scripts/create-users.sh"
