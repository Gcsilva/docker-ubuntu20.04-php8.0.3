# docker-ubuntu20.04-php8.0.3
Environment -> Ubuntu 20.04 - PHP 8.0.3


FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y upgrade \
RUN apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php && apt-get -y update \
RUN apt-get -y install php8.0 libapache2-mod-php8.0 \
RUN apt-get -y install php8.0-cli php8.0-common php8.0-mysql \
RUN apt-get -y install libapache2-mod-php8.0 php8.0-gd php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-soap php8.0-xml php8.0-xmlrpc php8.0-zip php8.0-curl php8.0-dev \
RUN apt-get -y install php8.0-bcmath 

RUN echo "ServerName docker_localhost" >> /etc/apache2/apache2.conf \
RUN a2enmod rewrite && chown -R www-data:www-data /var/www 

ENV APACHE_RUN_USER www-data ENV APACHE_RUN_GROUP www-data ENV APACHE_LOG_DIR /var/log/apache2 

EXPOSE 80 \
CMD apachectl -D FOREGROUND
