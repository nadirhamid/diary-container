FROM node:12 as appcode

WORKDIR /app/
ADD ./diary/ .
RUN npm i
RUN npm run build
FROM nginx:1.23.1 as webserver

COPY --from=appcode /app/build/ /usr/share/nginx/html