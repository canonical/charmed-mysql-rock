FROM ubuntu/mysql:8.0-22.04_beta

ARG CONFIG_VERSION="0.8.22-1"

RUN set -eux && DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get install -y wget lsb-release gnupg && \
	wget -q https://dev.mysql.com/get/mysql-apt-config_${CONFIG_VERSION}_all.deb \
        -O /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    dpkg -i /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    apt-get update && \
    apt-get install -y mysql-shell && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306 33060 33061
