FROM centos:7

# IMPORT the Centos-7 GPG key to prevent warnings
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

# Add bintray repository where the SBT binaries are published
RUN curl -sS https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo

# Base Install + JDK
RUN yum -y update && \
    yum -y install java-1.8.0-openjdk && \
    yum -y install java-1.8.0-openjdk-devel && \
    yum -y install sbt && \
    yum -y update bash

# Run SBT once so that all libraries are downloaded
RUN sbt exit

RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && curl -s https://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.11.0.2/kafka_2.11-0.11.0.2.tgz | tar -xz --strip-components=1 \
  && yum clean all

RUN chmod -R a=u /opt/kafka

WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
