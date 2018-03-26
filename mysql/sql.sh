#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

MYSQL_ROOT_PASSWORD='root'
echo debconf mysql-server/root_password password $MYSQL_ROOT_PASSWORD | debconf-set-selections
echo debconf mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | debconf-set-selections