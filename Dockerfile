FROM centos/mysql-80-centos7
      

RUN mkdir /mysqldb && \
    chmod 777 /mysqldb && \
    mkdir /root/app
WORKDIR /root/app


RUN sed -i "s/^datadir=.*$/datadir=\/mysqldb/" /etc/my.cnf.d/base.cnf


USER 1001
EXPOSE 3306
ENTRYPOINT ["run-mysqld"]

