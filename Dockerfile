FROM ubuntu:18.04
COPY . /myapp
WORKDIR /myapp
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y php php-fpm php-pgsql php-mbstring
EXPOSE 8080
CMD php -S 0.0.0.0:8080/graphql src/graphql/v1/schema.php
