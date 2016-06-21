#VERSION 0.1
# Hue (http://gethue.com) Dockerfile

FROM dmavitch/orcljdk8 

MAINTAINER Ilya Shataev <ilya.shataev@gmail.com>

RUN yum install -y ant make gcc krb5-devel mysql-devel openssl-devel \
    cyrus-sasl-devel cyrus-sasl-gssapi sqlite-devel libtidy libxml2-devel libxslt-devel \
    openldap-devel python-devel python-simplejson python-setuptools \
    gmp-devel openssl-devel gcc-c++ libffi-devel git && \
    yum clean all

ENV HU_VERSION=3.10.0 \
    HU_REVISION=852d4735702b0f75c039d6e4efaa4704e3f07bb3
    #HU_CONFIGFILE=/hue/desktop/conf/hue.ini

#RUN mkdir -p /opt && \
#    cd /opt && \
#git clone https://github.com/cloudera/hue.git && \
# cd /opt/hue && \ 
#git checkout ${HU_REVISION} && \
    #unzip -d / ./target/universal/kafka-manager-${KM_VERSION}.zip && \ mkdir /kafka-manager-${KM_VERSION}/logs && \
    #rm -fr /tmp/* /root/.sbt /root/.ivy2 && \

RUN wget -nv --no-cookies --no-check-certificate "https://dl.dropboxusercontent.com/u/730827/hue/releases/${HU_VERSION}/hue-${HU_VERSION}.tgz" -O /tmp/hue-${HU_VERSION}.tgz && \
    tar xzf /tmp/hue-${HU_VERSION}.tgz -C /opt && \ 
    rm -f /tmp/hue-${HU_VERSION}.tgz

#groupadd hadoop
#add user
RUN useradd -d /home/hue/ -s /bin/bash hue

WORKDIR /opt/hue-${HU_VERSION}

#build apps
RUN make apps && \
    chown -R hue /opt/hue-${HU_VERSION}/ 

#RUN printf '#!/bin/sh\nexec ./build/env/bin/supervisor -d "${@}"\n' > /opt/hue-${HU_VERSION}/hue.sh
RUN printf '#!/bin/sh\nexec ./build/env/bin/hue runserver_plus 0.0.0.0:8888 "${@}"\n' > /opt/hue-${HU_VERSION}/hue.sh && \
    chmod +x /opt/hue-${HU_VERSION}/hue.sh

#install pip and werkzeug
RUN yum install -y epel-release
RUN yum install -y python-pip && \
    pip install Werkzeug && \
    yum clean all

USER hue

EXPOSE 8888
CMD ["./hue.sh"]
#ENTRYPOINT ["./hue.sh"]