FROM docker.io/mysql/mysql-server
COPY entrypoint.sh /
COPY my.cnf /etc/
RUN chown root:root /etc/my.cnf; chmod u=rw,go=r /etc/my.cnf
RUN chown root:root /entrypoint.sh; chmod u=rwx,go=rx /entrypoint.sh
RUN mkdir -p /var/lib/mysql ; chown root:root /var/lib/mysql; chmod a=rwx /var/lib/mysql
RUN mkdir -p /var/lib/mysql-files ; chown mysql:mysql /var/lib/mysql-files; chmod a=rwx /var/lib/mysql-files
RUN mkdir -p /var/run/mysqld ; chown mysql:mysql /var/run/mysqld; chmod a=rwx /var/run/mysqld
RUN mkdir -p /var/log/mysqld ; chown mysql:mysql /var/log/mysqld; chmod a=rwx /var/log/mysqld
USER mysql