FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade


#Enter pass for root in mysql
COPY sql.sh /sql.sh
RUN sh /sql.sh

#destroy mistake with policy-rc.d
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

#install mysql
RUN apt-get update && \
    apt-get install -y mysql-server && \
    chown -R mysql:mysql /var/lib/mysql 

ADD my.cnf /etc/mysql/conf.d/my.cnf 

EXPOSE 80
CMD ["mysqld"]

