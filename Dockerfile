FROM ubuntu:14.04

RUN echo "deb http://mirror.aarnet.edu.au/pub/MariaDB/repo/10.1/ubuntu trusty main" >>/etc/apt/sources.list && \
	DEBIAN_FRONTEND=noninteractive apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
	DEBIAN_FRONTEND=noninteractive apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install mariadb-server && \
	apt-get clean -y && \
	rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY extra.cnf /etc/mysql/conf.d/extra.cnf
EXPOSE 3306

CMD ["/usr/sbin/mysqld", "--skip-grant-tables"]
