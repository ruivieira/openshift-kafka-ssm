FROM centos

# Env variables
ENV SCALA_TAR_URL http://www.scala-lang.org/files/archive 
ENV SCALA_VERSION 2.12.4 
ENV SBT_VERSION 0.13.8

RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s https://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz | tar -xz --strip-components=1 \
  && yum clean all

#install scala RUN wget $SCALA_TAR_URL/scala-$SCALA_VERSION.tgz
RUN tar xvf scala-$SCALA_VERSION.tgz \
  && mv scala-$SCALA_VERSION /usr/lib \
  && rm scala-$SCALA_VERSION.tgz \
  && ln -s /usr/lib/scala-$SCALA_VERSION /usr/lib/scala

RUN chmod -R a=u /opt/kafka
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
