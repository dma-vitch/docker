#VERSION 0.1
# ZKui https://github.com/tekcomms/zkui Dockerfile

FROM dma-vitch/maven

MAINTAINER Ilya Shataev <ilya.shataev@gmail.com>

RUN yum install -y git && \
    yum clean all

RUN mkdir -p /opt/zookeeper-ui && \
    cd /tmp && \
    git clone https://github.com/tekcomms/zkui && \
    cd /tmp/zkui && \
    mvn clean install && \
    mv /tmp/zkui/target/zkui-*-jar-with-dependencies.jar /opt/zookeeper-ui/zkui.jar && \
    mv config.cfg /opt/zookeeper-ui/ && \
    rm -rf /tmp/zkui /root/.m2/repository

COPY bootstrap.sh /opt/zookeeper-ui/bootstrap.sh

RUN chmod +x /opt/zookeeper-ui/bootstrap.sh

WORKDIR /opt/zookeeper-ui

EXPOSE 9090

ENTRYPOINT ["./bootstrap.sh"]
