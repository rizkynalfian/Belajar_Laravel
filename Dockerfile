#using this awesome preguild image:
FROM '123majumundur/php-7.1-nginx:cicd'
MAINTAINER Rizki Alfian <alfian.rizkynur@gmail.com>

#Install prestissimo for faster deps instalation
RUN composer globar require hirak/prestissimo

#Make directory for hosting the apps
RUN mkdir /home/app/app
WORKDIR /home/app/app

# Install dependencies 
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

# copy database
COPY --chown=app:root . ./



# Finish composer
#run composer dumb-autoload
RUN composer dumb-autoload --no-scripts --no-dev --optimize

EXPOSE 8080