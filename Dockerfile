FROM node:10 AS front-end-build
WORKDIR /usr/src/app
COPY front-end/ ./front-end/
RUN cd front-end && npm install && npm run build

FROM node:10 AS server
WORKDIR /root/
COPY --from=front-end-build /usr/src/app/front-end/build ./front-end/build
COPY api/package*.json ./api/
RUN cd api && npm install
COPY api/index.js ./api/

EXPOSE 3080

CMD ["node", "./api/index.js"]