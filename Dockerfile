FROM centos/mysql-80-centos7


ENV MYSQL_ROOT_PASSWORD=mysql \
    MYSQL_DATABASE=demoÅ@\
    MYSQL_PASSWORD=mysqlÅ@\
    MYSQL_USER=demo

USER root
RUN yum clean all -y && \
  yum install -y git

USER 1001
RUN mkdir /root/app
WORKDIR /root/app
RUN git clone https://github.com/yuu-ymt/rhocp-demo-mysql.git
mv rhocp-demo-mysql/* .



EXPOSE 3306
ENTRYPOINT ["run-mysqld"]

