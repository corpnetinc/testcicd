FROM node:18

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

WORKDIR /github/workspace

USER node

ENTRYPOINT ["/entrypoint.sh"]
