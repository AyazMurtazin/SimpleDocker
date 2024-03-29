#!/bin/bash

docker build -t fcgi:part5 .

docker run -d -p 80:81 -v ./nginx:/etc/nginx fcgi:part5