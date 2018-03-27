FROM ubuntu:16.04


ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Europe/Minsk'

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2 
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2 
ENV APACHE_SERVER_ADMIN admin@localhost 
ENV APACHE_SERVER_NAME localhost 
ENV APACHE_SERVER_ALIAS docker.localhost 
ENV APACHE_DOCUMENT_ROOT /var/www/html 
ENV APACHE_WORKER_START_SERVERS 2 
ENV APACHE_WORKER_MIN_SPARE_THREADS 2 
ENV APACHE_WORKER_MAX_SPARE_THREADS 10 
ENV APACHE_WORKER_THREAD_LIMIT 64 
ENV APACHE_WORKER_THREADS_PER_CHILD 25 
ENV APACHE_WORKER_MAX_REQUEST_WORKERS 4 
ENV APACHE_WORKER_MAX_CONNECTIONS_PER_CHILD 0

ENV LANGUAGE en_US.UTF-8 
ENV LANG en_US.UTF-8 
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl locales apache2 tzdata m4 && \
    apt-get clean

RUN a2enconf server-name && \
    a2enmod rewrite && \
    a2enmod cgi && \
    a2enmod expires && \
    a2enmod headers && \
    a2enmod remoteip && \
    a2enmod status && \
    a2dismod mpm_prefork && \
    a2dismod mpm_event && \
    a2enmod mpm_worker && \
    a2disconf serve-cgi-bin && \
    a2enconf db-env && \
    a2enconf html && \
    a2enconf logging && \
    a2enconf cgi-bin && \
    a2enconf error-log && \
    a2enconf security    

EXPOSE 80