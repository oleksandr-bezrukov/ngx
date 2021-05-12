FROM ubuntu:20.04

ENV TZ=Europe/Kiev
ARG DEBIAN_FRONTEND noninteractive
#Lets install NGINX
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt-get -y update && \
apt -q -y --no-install-recommends install dialog apt-utils nginx mc nano curl telnet net-tools default-jdk sudo && \
mkdir -p /var/www/html
#/usr/share/nginx/html

#Copy ngnx configs to container
COPY index.html /var/www/html
#/usr/share/nginx/html
COPY nginx.conf /etc/nginx
COPY upstr.conf /etc/nginx/conf.d
#COPY nginx.conf /etc/nginx
#lets expose port 80
EXPOSE 8080/tcp

#Run nginx
CMD ["/usr/sbin/nginx","-g","daemon off;"]
