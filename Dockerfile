FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#copy our source build folder to nginx container
COPY --from=builder /app/build /usr/share/nginx/html