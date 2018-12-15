FROM node:alpine as basestage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=basestage /app/build /usr/share/nginx/html


