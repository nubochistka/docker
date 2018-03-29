#!/bin/bash
chown -R mysql:mysql /var/lib/mysql
exec /usr/sbin/mysqld