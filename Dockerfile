FROM node:alpine3.11

RUN npm install -g http-server

RUN mkdir -p /app

WORKDIR /app

COPY autoscriber-frontend/package*.json ./

RUN npm install

COPY autoscriber-frontend/ .

RUN npm run build

EXPOSE 8080

CMD [ "http-server", "dist" ]
