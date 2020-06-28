FROM node:13

RUN apt-get --assume-yes update
RUN apt-get --assume-yes upgrade

RUN apt-get --assume-yes install git ca-certificates fonts-liberation gconf-service libappindicator1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils

RUN sysctl -w kernel.unprivileged_userns_clone=1

RUN adduser rbrusr

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN chown -R rbrusr /usr/src/app
USER rbrusr
ENV PORT 4000
EXPOSE 4000
CMD [ "npm", "run", "start" ]
