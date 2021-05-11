<p>FROM ubuntu:20.04</p>

<p>
    RUN apt-get -y update && apt-get -y upgrade
    <br />
    RUN apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php && apt-get -y update
    <br />
    RUN apt-get -y install php8.0-cli php8.0-common php8.0-mysql
    <br />
    RUN apt-get -y install php8.0 libapache2-mod-php8.0
    <br />
    RUN apt-get -y install libapache2-mod-php8.0 php8.0-gd php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-soap php8.0-xml php8.0-xmlrpc php8.0-zip php8.0-curl php8.0-dev
    <br />
    RUN apt-get -y install php8.0-bcmath
</p>

<p>
    RUN echo "ServerName docker_localhost" >> /etc/apache2/apache2.conf
    <br />
    RUN a2enmod rewrite && chown -R www-data:www-data /var/www
</p>

<p>
    RUN cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    <br />
    RUN cd ~ && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
</p>

<p>ENV APACHE_RUN_USER www-data ENV APACHE_RUN_GROUP www-data ENV APACHE_LOG_DIR /var/log/apache2</p>

<p>EXPOSE 80</p>
<p>CMD apachectl -D FOREGROUND</p>