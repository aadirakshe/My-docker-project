FROM centos:centos6.8
MAINTAINER The Zycus assignment-1 <aadirakshe@gmail.com>

# Installing updates
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install gcc xz sudo tar wget mlocate java-1.8.0-openjdk java-1.8.0-openjdk-devel; yum clean all

# Installing Python-2.7
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz && \
    unxz Python-2.7.14.tar.xz && \
    tar -xvf Python-2.7.14.tar && \
    cd Python-2.7.14 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall

# Installaing MongoDB
RUN yum install -y mongodb-server; yum clean all

# Installaing apache-tomcat
RUN cd /tmp && \
    wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz && \
    tar zxvf apache-tomcat-7.0.82.tar.gz && \
    mv apache-tomcat-7.0.82 /opt/tomcat7 && \
    chmod -R 755 /opt/tomcat7

# Working directory for tomcat7
WORKDIR /opt/tomcat7/bin/

# Exposing port 8080 to outside container 
EXPOSE 8080

# Start Tomcat service
CMD ["./catalina.sh","run"]
