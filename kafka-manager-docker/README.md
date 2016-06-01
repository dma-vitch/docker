# kafka manager Dockerfile
[kafka manager](https://github.com/yahoo/kafka-manager) is a tool from Yahoo Inc. for managing [Apache Kafka](http://kafka.apache.org).
## Base Docker Image ##
* [centos:7](https://hub.docker.com/_/centos/)

## Howto
### Quick Start
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="your-zk.domain:2181" -e APPLICATION_SECRET=bebebebsdasd dmavitch/kafka-manager
```
(if you don't define ZK_HOSTS, default value has been set to "localhost:2181")
config copy into container (application.conf kafka logback.xml logger.xml)

###SSL

SSL on by default
certificate name is `kafka` (generate by localhost)

You can use env variablet variable for ssl

`KM_KEYSTORE` - default value has been set to "/kafka-manager-${KM_VERSION}/conf/kafka"
`KM_KEYSTORE_PASS` - default value has been set to "123456"

### Use your own configuration file
you can specify a configuration file via an environment variable.
```
docker run [...] -v /path/to/confdir:/opt -e KM_CONFIG=/opt/my_shiny.conf dmavitch/kafka-manager
```

### Pass arguments to kafka-manager
you can use env variable `KM_ARGS`.
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="your-zk.domain:2181" -e APPLICATION_SECRET=bebebebsdasd -e KM_ARGS=-Djava.net.preferIPv4Stack=true dmavitch/kafka-manager 
```

### Specify a revision
If you want to upgrade/downgrade this Dockerfile, edit it and set `KM_VERSION` and `KM_REVISION` to fetch the release from github.
