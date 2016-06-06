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

#add additional property
RUN echo 'org.osgi.framework.bootdelegation=sun.*,com.sun.*,javax.*,org.w3c.*,org.xml.*,org.ietf.*' >> /opt/felix/felix-framework-${felix_version}/conf/config.properties && \
    echo 'org.osgi.framework.system.packages.extra=org.w3c.dom.traversal,org.w3c.dom,org.w3c.dom.ranges,com.sun.jndi,com.sun.jndi.ldap,sun.misc,javax.management' >> /opt/felix/felix-framework-${felix_version}/conf/config.properties
	
#ENV JVM_OPTIONS="-Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=8000,suspend=n"

USER felix

WORKDIR /opt/felix/felix-framework-${felix_version}

CMD ["bash"]
#CMD exec java $JVM_OPTIONS -jar bin/felix.jar
