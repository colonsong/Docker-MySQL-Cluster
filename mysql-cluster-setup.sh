#!/bin/bash

# Create user mysql
groupadd mysqlgroup
useradd -g mysqlgroup -d /home/mysql -m -s /bin/bash mysql
echo "mysql:admin123" | chpasswd
echo "mysql ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create symbolic link
ln -s /opt/mysql/server-5.6/bin/mysqld /usr/local/bin/mysqld
ln -s /opt/mysql/server-5.6/bin/ndbd /usr/local/bin/ndbd
ln -s /opt/mysql/server-5.6/bin/ndb_mgm /usr/local/bin/ndb_mgm
ln -s /opt/mysql/server-5.6/bin/ndb_mgmd /usr/local/bin/ndb_mgmd
chmod +x /usr/local/bin/*

# Creat require directories
mkdir /mysqldata
chown -R mysql:mysqlgroup /mysqldata
mkdir -p /mysql-cluster-data
mkdir -p /usr/local/mysql/mysql-cluster
