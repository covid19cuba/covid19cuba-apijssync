FROM node:12.17.0-alpine

WORKDIR /usr/src/app

COPY . .

RUN yarn install
RUN yarn build

EXPOSE 4000

CMD ["yarn", "start"]
