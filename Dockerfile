FROM node:20-alpine
RUN addgroup -S expense && adduser -S expense -G expense
RUN mkdir /opt/backend
RUN chown -R expense:expense /opt/backend
WORKDIR /opt/backend
COPY package.json .
COPY *.js ./
RUN npm install
ENV DB_HOST="mysql"
USER expense
CMD ["node","index.js"]