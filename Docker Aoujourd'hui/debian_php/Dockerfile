FROM debian

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y libapache2-mod-php8.2

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D",  "FOREGROUND" ]
