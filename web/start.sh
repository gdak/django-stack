#!/bin/bash
service nginx restart
service supervisor stop
/bin/wait-for-it.sh db:3306 -t 0 -- echo "Waiting for MySQL..."
python /web/webprj/manage.py migrate
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisor_webprj.conf
