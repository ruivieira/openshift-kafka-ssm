FROM centos

# Env variables
ENV SCALA_TAR_URL http://www.scala-lang.org/files/archive 
ENV SCALA_VERSION 2.12.4 
ENV SBT_VERSION 0.13.8

RUN mkdir -p /opt/kafka \
  && mkdir -p /opt/scala-$SCALA_VERSION \
  && cd /opt/kafka \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s https://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz | tar -xz --strip-components=1 \
  && yum clean all

RUN chmod -R a=u /opt \
  && chmod -R a=u /opt/kafka \
  && chmod -R a=u /opt/scala-$SCALA_VERSION

#install scala 
RUN cd /opt \
  && wget $SCALA_TAR_URL/scala-$SCALA_VERSION.tgz \
  && tar xvf scala-$SCALA_VERSION.tgz \
  && rm scala-$SCALA_VERSION.tgz


WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
