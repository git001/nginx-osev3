# based on https://hub.docker.com/_/nginx/
FROM debian:jessie

MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com", aleks

ENV NGINX_VERSION 1.9.11-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" \
	  apt-get install -y --no-install-recommends ca-certificates nginx=${NGINX_VERSION} gettext-base socklog-run \
	&& apt-get -y clean autoclean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/{apt,dpkg,cache,log}/ \
	&& chmod 777 /var/cache/nginx

COPY containerfiles /

EXPOSE 8080 8443 8514

# orig line
# CMD ["nginx", "-g", "daemon off;"]
# test run
CMD ["/bin/bash","-c","sleep 500"]
# CMD ["/nginx-wrapper.sh"]
