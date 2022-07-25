FROM node:12 as appcode

WORKDIR /app/
ADD . .
RUN yarn
RUN yarn build
FROM nginx:1.23.1 as webserver

COPY --from=appcode /app/bundle/ /usr/share/nginx/html