FROM node:12 as appcode

WORKDIR /app/
ADD . .
RUN yarn install
RUN yarn build
FROM nginx:1.23.1 as webserver

COPY --from=appcode /app/dist/ /usr/share/nginx/html