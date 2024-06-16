#!/bin/bash

/usr/sbin/sshd -D &

/usr/sbin/nginx &

php-fpm

