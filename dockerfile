# initial step for building the application for production
FROM node:alpine as builder

WORKDIR /usr/app

COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#nginx step for running the build version of the application
FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html
