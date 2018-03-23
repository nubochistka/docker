FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Europe/Minsk'

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

RUN apt-get install -y apache2 \
      software-properties-common

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php5-compat

RUN apt-get update && \
    apt-get install -y php5.6 php5.6-mysql php5.6-memcached memcached libapache2-mod-php5

ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2 

RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl


RUN apt-get install -y supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
RUN mkdir -p /etc/supervisor/conf.d
COPY apache2.conf /etc/supervisor/conf.d/apache2.conf
COPY memcached.conf /etc/supervisor/conf.d/memcached.conf

VOLUME ["/etc/supervisor/conf.d"]

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]