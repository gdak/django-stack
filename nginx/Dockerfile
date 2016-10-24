FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500
RUN apt-get update && apt-get -y install unzip
ADD start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
RUN rm -rf /etc/nginx/conf.d/*.conf

ADD https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_linux_amd64.zip /usr/bin/
RUN cd /usr/bin/ && unzip consul-template_0.16.0_linux_amd64.zip
RUN chmod +x /usr/bin/consul-template
