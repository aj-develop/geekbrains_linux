# 3. * Используя Dockerfile, собрать связку nginx + PHP-FPM в одном контейнере.
alex@alex-ubuntu:~$ nano docker-compose.yml

version: “3.3”

services:
  web:
    image: nginx:latest
    container_name: web
    ports:
      – “80:80”
    volumes:
      – ./code:/code
      – ./site.conf:/etc/nginx/conf.d/default.conf

  php:
    image: php:7-fpm
    container_name: php
    volumes:
      – /home/alex/project/minipetct.hu/code:/code


alex@alex-ubuntu:~$ site.conf

server {
  index index.php;
  index index.html;
  server_name php-docker.local;
  error_log /var/log/nginx/error.log;
  access_log /var/log/nginx/access.log;
  root /code;

  # PHP-FPM Configuration Nginx
  location ~ \.php$ {
    try_files $uri = 404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass php:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param REQUEST_URI $request_uri;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param PATH_INFO $fastcgi_path_info;
  }
}