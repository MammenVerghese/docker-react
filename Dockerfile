FROM node:16-alpine as build
WORKDIR /app/build-only-frontend
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /app/build-only-frontend/build /usr/share/nginx/html
