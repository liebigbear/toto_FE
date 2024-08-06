# Build stage
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16
WORKDIR /usr/src/app
COPY toto-fe/package*.json ./
RUN npm install react-router-dom
RUN mkdir build
COPY krampoline/build/ ./build/
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "build"]
