FROM nginx:latest

RUN apt-get update

RUN apt-get install -y gcc libfcgi-dev spawn-fcgi  

ADD server/main.c main.c

RUN  gcc main.c -lfcgi -o mini_server

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 81

ENTRYPOINT spawn-fcgi -a 127.0.0.1 -p 8080 ./mini_server & nginx -g "daemon off;"