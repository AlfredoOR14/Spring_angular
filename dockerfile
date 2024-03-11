# INSTALACION DE NODE
FROM node:18.15.0 as node15-cons
RUN mkdir -p /app-inventario
WORKDIR /app-inventario
COPY package.json /app-inventario/
RUN npm install
COPY . /app-inventario/
RUN npm run build --prod

# INSTALACION DEL SERVIDOR DONDE CORRERA NODE
FROM nginx:1.17.1-alpine
COPY --from=node15-cons app-inventario/dist/inventario-app /usr/share/nginx/html
