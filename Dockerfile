############################################################
# Dockerfile to run towan container
#
############################################################

FROM django:python2-onbuild
MAINTAINER Lola Rigaut-Luczak <rllola80@gmail.com>

# Important Mise à jour toujours avant
RUN apt-get -y update

# To teddy a bit the room
RUN apt-get -y autoremove

RUN useradd -u 1000 -g 100 -d /home/django django

USER django

ADD ./_scripts/docker-entrypoint.sh /home/django/

EXPOSE 8000

ENTRYPOINT ["/bin/bash", "-e", "/home/django/docker-entrypoint.sh"]
