# Oracle JRE Server Dockerfile
## Base Docker Image ##
* [centos:7-jdk8](https://hub.docker.com/r/dmavitch/orcljdk8/)
* [base code for maven install] (https://github.com/carlossg/docker-maven/tree/master/jdk-8)

## Howto
### Quick Start
```
docker run -it --rm  dmavitch/maven
```
### Specify a revision
If you want to upgrade/downgrade this Dockerfile, edit it and set `MAVEN_VERSION`.
