FROM centos/mysql-80-centos7


ENV MYSQL_ROOT_PASSWORD=mysql \
    MYSQL_DATABASE=demo \
    MYSQL_PASSWORD=mysql \
    MYSQL_USER=demo

USER root
RUN yum clean all -y && \
  yum install -y git

RUN mkdir /root/app
WORKDIR /root/app
RUN git clone https://github.com/yuu-ymt/rhocp-demo-mysql.git
RUN mv rhocp-demo-mysql/* . && \
    chmod +x *.sh && \
    chgrp -R 0 /root/app && \
    chmod -R g+rwX /root/app


USER 1001

EXPOSE 3306
ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]

