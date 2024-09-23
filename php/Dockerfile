FROM php:latest

LABEL maintainer="SPL <sgpolin@gmail.com>"

EXPOSE 80

COPY ./app /var/www/html/

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

ENV ConnectionStrings__DefaultConnection="host=mariadb;user=root;password=1234;dbname=php"

CMD ["php", "-S", "0.0.0.0:80"]