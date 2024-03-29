#!/bin/bash

gcc main.c -lfcgi -o mini_server
spawn-fcgi -p8080 -n ./mini_server