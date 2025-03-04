FROM node:16
WORKDIR /usr/src/app
COPY package*.json ./
Run npm ci --only=production
COPY ..
EXPOSE 8080
CMD ["node", "server.js" ]
