FROM centos:7
      
RUN yum clean all -y && \
  yum install -y git && \
  yum install -y mysql mysql-server && \
  yum clean all -y

RUN mkdir /root/app
WORKDIR /root/app


USER 1001
EXPOSE 3306
ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]



