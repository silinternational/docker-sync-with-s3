FROM alpine:3.4

RUN apk update \
    && apk add ca-certificates python py-pip \
    && pip install s3cmd

COPY run.py /run.py
COPY crontab.txt /etc/crontabs/root
COPY entry.sh /entry.sh
COPY .s3cfg /root/.s3cfg

RUN chmod 755 /entry.sh

CMD ["/entry.sh"]