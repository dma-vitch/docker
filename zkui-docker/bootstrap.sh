#!/bin/bash

ZK_HOSTS=${ZK_HOSTS:-"localhost:2181"}

USER_SET=${USER_SET:-"{\"users\": [{ \"username\":\"admin\" , \"password\":\"manager\",\"role\": \"ADMIN\" \},{ \"username\":\"appconfig\" , \"password\":\"appconfig\",\"role\": \"USER\" \}]\}"}
LOGIN_MESSAGE=${LOGIN_MESSAGE:-"Please login using admin/manager or appconfig/appconfig."}

sed -i -e "s/^zkServer=.*$/zkServer=$ZK_HOSTS/" /opt/zookeeper-ui/config.cfg

sed -i -e "s/^userSet=.*$/userSet=$USER_SET/" /opt/zookeeper-ui/config.cfg
sed -i -e "s/^loginMessage=.*$/loginMessage=$LOGIN_MESSAGE/" /opt/zookeeper-ui/config.cfg

echo "Starting zkui with server $ZK_HOSTS"

exec java -Djava.io.tmpdir=/opt/zookeeper-ui/tmp/ -jar zkui.jar