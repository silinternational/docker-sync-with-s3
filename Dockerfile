FROM alpine:3.8

RUN apk update \
    && apk add python py-pip rsyslog rsyslog-tls ca-certificates openssl \
    && pip install awscli

COPY run.py /run.py
COPY crontab.txt /crontab.txt
COPY crontab-syslog.txt /crontab-syslog.txt
COPY rsyslog.conf /etc/rsyslog.conf
COPY entry.sh /entry.sh

RUN chmod 755 /entry.sh

CMD ["/entry.sh"]
