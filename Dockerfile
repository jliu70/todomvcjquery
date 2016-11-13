FROM node:5.11.0-slim


WORKDIR /app

RUN npm install -g nodemon
COPY package.json /app/package.json
RUN npm config set registry http://registry.npmjs.org
RUN npm install && npm ls && apt-get update && apt-get -y install jq
#RUN mv /app/node_modules /node_modules

COPY . /app

ENV PORT 80
EXPOSE 80

#add entrypoint and start up scripts
#COPY .docker /usr/local/bin

#entrypoint script to set env vars when linking containers for dev
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["node", "server.js"]
