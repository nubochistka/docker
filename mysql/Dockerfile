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
    usermod -d /var/lib/mysql/ mysql 

COPY my.cnf /etc/mysql/conf.d/my.cnf 
RUN rm /etc/mysql/mysql.conf.d/mysqld.cnf
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY run.sh /run

EXPOSE 3306
CMD ["/run"]