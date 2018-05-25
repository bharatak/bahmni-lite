#!/bin/sh
mysql -h$MYSQL_HOST -uroot -p$MYSQL_ROOT_PASSWORD -e "drop database openmrs"
mysql -h$MYSQL_HOST -uroot -p$MYSQL_ROOT_PASSWORD -e "create database openmrs"
mysql -h$MYSQL_HOST -uroot -p$MYSQL_ROOT_PASSWORD openmrs < /tmp/openmrs_backup.sql
mysql -h$MYSQL_HOST -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON openmrs.* TO 'openmrs-user'@'%' identified by 'password'  WITH GRANT OPTION;"
mysql -h$MYSQL_HOST -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES"