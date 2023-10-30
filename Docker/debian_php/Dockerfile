FROM debian

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y libapache2-mod-php8.2 && \
    apt-get install -y php-mysql

RUN echo "ServerName localhost" >> /etc/apache2.conf

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D",  "FOREGROUND" ]

EXPOSE 80