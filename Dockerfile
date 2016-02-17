# based on https://hub.docker.com/_/nginx/
FROM debian:jessie

MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com", aleks

ENV NGINX_VERSION 1.9.11-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN  ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && sed -e 's/^error_log.*/error_log stderr warn;/' /etc/nginx/nginx.conf > /tmp/nginx.conf.new \
  && sed -e 's/access_log.*/access_log \/dev\/stdout;/' /tmp/nginx.conf.new > /tmp/nginx.conf.new2 \
  && sed -e 's/^pid.*/pid \/tmp\/nginx.pid;/' /tmp/nginx.conf.new2 > /tmp/nginx.conf.new3 \
  && mv /tmp/nginx.conf.new3 /etc/nginx/nginx.conf \
  && chmod 777 /var/cache/nginx

# /dev/stdout
# && sed -e 's/^user/#user/' /etc/nginx/nginx.conf > /etc/nginx/nginx.conf

EXPOSE 8080 8443

CMD ["nginx", "-g", "daemon off;"]
# CMD ["/bin/bash","-c","read -t 500 lal"]
# CMD ["/bin/bash","-c","sleep 500"]
