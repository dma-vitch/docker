# Oracle JRE Server Dockerfile
## Base Docker Image ##
* [centos:7](https://hub.docker.com/_/centos/)

## Howto
### Quick Start
```
docker run -it --rm  dmavitch/orcljdk8
```
### Specify a revision
If you want to upgrade/downgrade this Dockerfile, edit it and set `JAVA_UPDATE` and `JAVA_BUILD`.
