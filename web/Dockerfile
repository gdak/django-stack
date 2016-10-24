FROM python:2.7

ENV SECRET_KEY ${SECRET_KEY}
ENV DEBUG ${DEBUG}
ENV IN_DEV ${IN_DEV}

RUN DEBIAN_FRONTEND=noninteractive apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nginx
RUN service nginx stop
# RUN alias python='/usr/lib/python2.7'
RUN mkdir /web
ADD requirements.txt /web/requirements.txt
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor 
RUN service supervisor stop
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-pip
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libmysqlclient-dev
RUN pip install -r /web/requirements.txt 
RUN cd /web && django-admin.py startproject webprj 
#RUN cd /web/webprj && python manage.py migrate
RUN cd /web/webprj && python manage.py makemigrations
RUN mkdir -p /web/bin
ADD gunicorn_start /web/bin/gunicorn_start
RUN chmod +x /web/bin/gunicorn_start && mkdir -p /web/logs && mkdir -p /web/webprj/static && mkdir -p /web/webprj/media && touch /web/logs/gunicorn_supervisor.log
RUN rm -rf /etc/nginx/conf.d/*.conf
RUN rm -rf /etc/nginx/sites-enabled/*
ADD supervisor_webprj.conf /etc/supervisor/conf.d/
ADD nginx_webprj.conf /etc/nginx/conf.d/
ADD settings.py /web/webprj/webprj/
ADD wait-for-it.sh /bin/
RUN chmod +x /bin/wait-for-it.sh

EXPOSE 80

ENTRYPOINT /bin/start.sh

ADD start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
