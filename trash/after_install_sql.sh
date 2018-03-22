#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

mkdir /var/run/mysqld 
touch /var/run/mysqld/mysqld.sock 
chown -R mysql /var/run/mysqld 
service mysql restart

