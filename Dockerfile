FROM ubuntu/mysql:8.0-20.04_beta

ENV CONFIG_VERSION="0.8.22-1"

RUN set -eux && \
	apt-get update && \
	apt-get install -y wget lsb-release gnupg

RUN set -eux && \
	wget -q https://dev.mysql.com/get/mysql-apt-config_${CONFIG_VERSION}_all.deb \
        -O /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-shell && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306 33060

COPY docker-entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
