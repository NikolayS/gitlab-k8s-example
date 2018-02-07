FROM mhart/alpine-node:8
MAINTAINER kai@dotmesh.io
WORKDIR /app
COPY ./api/package.json /app/api/package.json
COPY ./api/yarn.lock /app/api/yarn.lock
RUN yarn install
COPY ./api /app/api
ENTRYPOINT ["node", "api/test/app.js"]