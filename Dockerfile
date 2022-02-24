FROM node:alpine as builder
#all command and all going to refer builder phase, it is used to install dependencise and application

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
