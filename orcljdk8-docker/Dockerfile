#VERSION 0.1
FROM centos:7

MAINTAINER Ilya Shataev <ilya.shataev@gmail.com>

RUN yum install -y wget unzip which && \
    yum clean all

#set timezone
ENV TIMEZONE Europe/Moscow

RUN echo ZONE="$TIMEZONE" > /etc/sysconfig/clock && \
    ln -fs "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime

#set java version
ENV JAVA_MAJOR=8 \
    JAVA_UPDATE=92 \
    JAVA_BUILD=14 

RUN wget -nv --no-cookies --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR}u${JAVA_UPDATE}-b${JAVA_BUILD}/server-jre-${JAVA_MAJOR}u${JAVA_UPDATE}-linux-x64.tar.gz" -O /tmp/jdk-${JAVA_MAJOR}u${JAVA_UPDATE}-linux-x64.tar.gz && \
    tar xzf /tmp/jdk-${JAVA_MAJOR}u${JAVA_UPDATE}-linux-x64.tar.gz -C /opt  && \
    rm -f /tmp/jdk-${JAVA_MAJOR}u${JAVA_UPDATE}-linux-x64.tar.gz

ENV JAVA_HOME=/opt/jdk1.8.0_${JAVA_UPDATE}

ENV PATH /opt/jdk1.8.0_${JAVA_UPDATE}/bin:$PATH

CMD ["bash"]
