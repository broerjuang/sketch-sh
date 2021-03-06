FROM node:10.8.0
RUN npm -g config set user root
RUN npm install -g bs-platform@4.0.3
WORKDIR /usr/src
COPY client/package-lock.json client/package.json ./
RUN npm link bs-platform
RUN npm install
COPY client .
RUN npm run ci:build
RUN mv ./build /public
