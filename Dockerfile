FROM node:12.17.0-alpine

WORKDIR /usr/src/app

COPY . .

RUN yarn install
RUN yarn build

RUN npm install pm2 -g

EXPOSE 4000

CMD ["pm2-runtime", "./dist/index.js"]
