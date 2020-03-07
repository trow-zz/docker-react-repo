FROM node:alpine as builder 
#Le damos un nombre a la fase de builder
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#/app/build tiene lo necesario para el proyecto en proyecto

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
#Copiamos del container anterior a la carpeta de nginx del proyecto final de Pro
