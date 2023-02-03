export CONFIG_DIR="/etc/mysql"
if [ ! -f "${CONFIG_DIR}/initialized" ]; then
        /usr/sbin/mysqld --initialize
        echo "configuration folder ${CONFIG_DIR} does not exist."
        echo "copying default config to ${CONFIG_DIR}"
    
        touch $CONFIG_DIR/initialized
fi

/usr/sbin/mysqld