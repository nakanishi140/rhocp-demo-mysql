FROM centos/mysql-80-centos7
      
RUN sed -i "s/^datadir =.*$/datadir = \/mysqldb/" /etc/my.cnf.d/base.cnf  

RUN yum clean all -y && \
  yum install -y git && \
RUN mkdir /root/app
WORKDIR /root/app

RUN git clone https://github.com/yuu-ymt/rhocp-demo-mysql.git
mv rhocp-demo-mysql/* .


USER 1001
EXPOSE 3306
ENTRYPOINT ["run-mysqld"]

