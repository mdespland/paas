FROM ubuntu
MAINTAINER Marc Despland <marc.despland@orange.com>
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php php-mcrypt php-mysql
EXPOSE 8080
COPY ports.conf /etc/apache2/
COPY 000-default.conf /etc/apache2/sites-available/
COPY entrypoint.sh /
RUN chown root:root /entrypoint.sh;chmod a=rx /entrypoint.sh
RUN mkdir -p /var/run/apache2; chown root:root /var/run/apache2; chmod a=rwx /var/run/apache2
RUN chmod a=rwx  /var/lock/apache2; chmod a=rwx /var/log/apache2; rm -f /var/log/apache2/*
ENTRYPOINT ["/entrypoint.sh"]
