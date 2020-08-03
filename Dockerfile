FROM centos/mysql-80-centos7

USER root
ENV MYSQL_USER=demo \
    MYSQL_DATABASE=demo \
    MYSQL_PASSWORD=mysql \
    MYSQL_ROOT_PASSWORD=mysql

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
ENTRYPOINT ["/root/app/run.sh"]

