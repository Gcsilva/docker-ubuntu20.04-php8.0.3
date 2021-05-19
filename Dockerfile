FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php && apt-get -y update
RUN apt-get -y install php8.0 libapache2-mod-php8.0
RUN apt-get -y install php8.0-cli php8.0-common php8.0-mysql
RUN apt-get -y install libapache2-mod-php8.0 php8.0-gd php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-soap php8.0-xml php8.0-xmlrpc php8.0-zip php8.0-curl php8.0-dev
RUN apt-get -y install php8.0-bcmath

RUN apt-get -y install zip unzip php-zip
RUN apt-get -y update --fix-missing
RUN apt-get -y install mysql-client

RUN echo "ServerName docker_localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite && chown -R www-data:www-data /var/www

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

ENV APACHE_RUN_USER www-data ENV APACHE_RUN_GROUP www-data ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80 
CMD apachectl -D FOREGROUND