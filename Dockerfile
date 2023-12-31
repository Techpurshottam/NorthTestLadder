FROM node:14-alpine

WORKDIR /usr/src/opt

COPY . .

RUN npm install --production

EXPOSE 3000

CMD ["npm", "start"]
