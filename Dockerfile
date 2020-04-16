
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#/app/build client

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default for nginx is start nginx 