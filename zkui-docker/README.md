# Zookeeper GUI Dockerfile
[Zkui](https://github.com/tekcomms/zkui) is a tool for managing [Apache Zookeeper](https://zookeeper.apache.org/).
## Base Docker Image ##
* [maven-jdk:8](https://hub.docker.com/r/dmavitch/maven/)

## Howto
### Quick Start
```
docker run -it --rm -p 9090:9090 dmavitch/zkui
```
(if you don't define ZK_HOSTS, default value has been set to "localhost:2181")
```
docker run [...] -e ZK_HOSTS="hostname" dmavitch/zkui
```
