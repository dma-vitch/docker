#VERSION 0.1
FROM dmavitch/orcljdk8:latest

MAINTAINER Ilya Shataev <ilya.shataev@gmail.com>

#set env for felix
ENV felix_version=5.4.0 \
    felix_base=http://apache-mirror.rbc.ru/pub/apache/felix

ENV felix_package=org.apache.felix.main.distribution-${felix_version}.tar.gz

ADD ${felix_base}/${felix_package} /tmp/

RUN mkdir -p /opt/felix && \
    cd /opt/felix && \
    tar xzf /tmp/${felix_package} -C /opt/felix/ && \
#    ln -s /opt/felix/felix-framework-${felix_version} /opt/felix/current && \
    rm -f /tmp/${felix_package}

RUN find /opt/felix/felix-framework-${felix_version} -regex '.*[.jar]$' -exec chmod +x {} \;

#add user for felix app
RUN useradd -c 'felix user' -m -d /home/felix -s /bin/bash felix

RUN chown -R felix /opt/felix/felix-framework-${felix_version}

USER felix

CMD ["bash"]
