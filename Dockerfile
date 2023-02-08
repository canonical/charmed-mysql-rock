FROM ubuntu/mysql:8.0-22.04_beta

ARG CONFIG_VERSION="0.8.24-1"

RUN mkdir -p /home/mysql
RUN chown mysql:mysql /home/mysql

RUN set -eux && DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get install -y wget lsb-release gnupg && \
	wget -q https://dev.mysql.com/get/mysql-apt-config_${CONFIG_VERSION}_all.deb \
        -O /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    dpkg -i /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    apt-get update && \
    apt-get install -y mysql-shell && \
    # requirements for xtrabackup
    apt-get install -y libdbd-mysql-perl libcurl4-openssl-dev rsync libev4 && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://downloads.percona.com/downloads/Percona-XtraBackup-LATEST/Percona-XtraBackup-8.0.30-23/binary/debian/jammy/x86_64/percona-xtrabackup-80_8.0.30-23-1.jammy_amd64.deb && \
    dpkg -i percona-xtrabackup-80_8.0.30-23-1.jammy_amd64.deb

EXPOSE 3306 33060 33061
