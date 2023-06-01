
FROM node:14

RUN apt-get update && apt-get install -y nginx supervisor

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

EXPOSE 80

CMD ["/usr/bin/supervisord"]