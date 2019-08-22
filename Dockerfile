ARG UVERSION
FROM ubuntu:$UVERSION

#RUN sed -i -e '/# deb http.* universe/s,^# ,,' /etc/apt/sources.list && \
#        sed -i -e '/# deb http.* multiverse/s,^# ,,' /etc/apt/sources.list && \
#        sed -i -e '/^deb http.*/s,deb http,deb [arch=amd64] http,' /etc/apt/sources.list && \

RUN apt-get update -qy && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  bash bash-completion bridge-utils curl iproute2 iputils-ping locales \
  net-tools traceroute unzip util-linux nginx && \
  echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
  locale-gen
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gettext

# RUN     apt-get autoremove && \
#         apt-get clean && \
#         rm -rf /var/lib/apt/lists/*

COPY run.sh nginx.conf.in /etc/
RUN chmod 755 /etc/run.sh

EXPOSE 80 443

CMD /etc/run.sh
