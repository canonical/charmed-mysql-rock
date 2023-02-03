#!/bin/bash

export CONFIG_DIR="/etc/mysql"
if [ ! -f "${CONFIG_DIR}/initialized" ]; then
        /usr/sbin/mysqld --initialize
        echo "configuration folder ${CONFIG_DIR} does not exist."
        echo "copying default config to ${CONFIG_DIR}"

        mkdir /var/lib/mysql-files
        mkdir /var/run/mysqld

        chown -R mysql:mysql /var/lib/mysql*
        chown -R mysql:mysql /var/run/mysqld

        
    
        touch $CONFIG_DIR/initialized
fi

/usr/bin/setpriv --clear-groups --reuid mysql --regid mysql -- /usr/sbin/mysqld