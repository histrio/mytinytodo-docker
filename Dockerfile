FROM php:7.4-apache

ENV VERSION 1.6.3

RUN apt-get update && apt-get -y install unzip
ADD https://github.com/maxpozdeev/mytinytodo/releases/download/v1.6.3/mytinytodo-v$VERSION.zip .
RUN ls -la 

#RUN wget $(curl -s https://api.github.com/repos/maxpozdeev/mytinytodo/releases/latest | grep 'browser_' | cut -d\" -f4) -O latest.zip
RUN unzip mytinytodo-v$VERSION.zip
RUN cp -R mytinytodo/* /var/www/html && chown -R www-data:www-data /var/www/html/*

