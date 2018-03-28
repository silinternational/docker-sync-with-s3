#!/bin/sh

# configure crontab based on the existance of the LOGENTRIES_KEY environment variable
if [ "$LOGENTRIES_KEY" ]; then
  cp /crontab-syslog.txt /etc/crontabs/root
  sed -i /etc/rsyslog.conf -e "s/LOGENTRIESKEY/${LOGENTRIES_KEY}/"
  rsyslogd
  sleep 10  # ensure rsyslogd is running before we may need to send logs to it
else
  cp /crontab.txt /etc/crontabs/root
fi

# setup env
mkdir -p /root/.aws
echo "[default]"                              > /root/.aws/config

echo "[default]"                              > /root/.aws/credentials
echo "aws_access_key_id = ${ACCESS_KEY}"     >> /root/.aws/credentials
echo "aws_secret_access_key = ${SECRET_KEY}" >> /root/.aws/credentials

python /run.py

# start cron
crond -f
