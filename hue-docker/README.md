# Cloudera HUE Server RELEASE Dockerfile
## Base Docker Image ##
* [centos:7-jdk8](https://hub.docker.com/r/dmavitch/orcljdk8/)

## Howto
### Quick Start
```
docker run -it --rm  -p 8888:8888 dmavitch/hue:3.10.0
```
### Specify a version
If you want to upgrade/downgrade this Dockerfile, edit it and set `HU_VERSION`.
