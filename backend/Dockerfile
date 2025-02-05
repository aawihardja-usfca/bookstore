FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --verbose

COPY . .

EXPOSE 8800

CMD ["npm", "start"]