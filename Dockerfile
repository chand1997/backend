FROM node:20
WORKDIR /app
COPY ./ .
RUN npm install
ENV DB_HOST="mysql"
CMD ["node","index.js"]