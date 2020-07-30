FROM centos:7
      
RUN rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm && \
  yum clean all -y && \
  yum install -y git && \
  yum install -y mysql-community-server && \
  yum clean all -y

RUN mkdir /mysqldb && \
    mkdir /mysqllog && \
    chmod 777 /mysqldb && \
    chmod 777 /mysqlog &&\
    mkdir /root/app
WORKDIR /root/app

RUN sed -i "s/^datadir=.*$/datadir=\/mysqldb/" /etc/my.cnf &&\
    sed -i "s/^log-error=.*$/log-error=\/mysqllog\/mysqld.log" /etc/my.cnf


USER 1001
EXPOSE 3306
ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]

