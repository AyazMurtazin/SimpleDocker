FROM nginx:latest

RUN apt-get update && apt-get install -y gcc libfcgi-dev spawn-fcgi && rm -rf /var/lib/apt/lists

COPY server/main.c main.c

RUN  gcc main.c -lfcgi -o mini_server

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 81

RUN groupadd -r mygroup

RUN useradd -r -g mygroup -G sudo myuser

ENTRYPOINT spawn-fcgi -a 127.0.0.1 -p 8080 ./mini_server & nginx -g "daemon off;"