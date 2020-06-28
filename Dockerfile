FROM node:13-alpine
RUN apk update && apk upgrade && apk add --no-cache git
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache fonts-liberation
RUN apk add --no-cache gconf-service
RUN apk add --no-cache libappindicator1
RUN apk add --no-cache libasound2
RUN apk add --no-cache libatk-bridge2.0-0
RUN apk add --no-cache libatk1.0-0
RUN apk add --no-cache libc6
RUN apk add --no-cache libcairo2
RUN apk add --no-cache libcups2
RUN apk add --no-cache libdbus-1-3
RUN apk add --no-cache libexpat1
RUN apk add --no-cache libfontconfig1
RUN apk add --no-cache libgbm1
RUN apk add --no-cache libgcc1
RUN apk add --no-cache libgconf-2-4
RUN apk add --no-cache libgdk-pixbuf2.0-0
RUN apk add --no-cache libglib2.0-0
RUN apk add --no-cache libgtk-3-0
RUN apk add --no-cache libnspr4
RUN apk add --no-cache libnss3
RUN apk add --no-cache libpango-1.0-0
RUN apk add --no-cache libpangocairo-1.0-0
RUN apk add --no-cache libstdc++6
RUN apk add --no-cache libx11-6
RUN apk add --no-cache libx11-xcb1
RUN apk add --no-cache libxcb1
RUN apk add --no-cache libxcomposite1
RUN apk add --no-cache libxcursor1
RUN apk add --no-cache libxdamage1
RUN apk add --no-cache libxext6
RUN apk add --no-cache libxfixes3
RUN apk add --no-cache libxi6
RUN apk add --no-cache libxrandr2
RUN apk add --no-cache libxrender1
RUN apk add --no-cache libxss1
RUN apk add --no-cache libxtst6
RUN apk add --no-cache lsb-release
RUN apk add --no-cache wget
RUN apk add --no-cache xdg-utils

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
ENV PORT 80
EXPOSE 80
RUN npm run build
CMD [ "npm", "run", "start" ]
