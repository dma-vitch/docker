# Apache Felix Framework Dockerfile
## Base Docker Image ##
* [centos:7-jdk8](https://hub.docker.com/r/dmavitch/orcljdk8/)

## Howto
### Quick Start
```
docker run -it --rm  dmavitch/felix-framework
```
### Specify a version
If you want to upgrade/downgrade this Dockerfile, edit it and set `felix_version`.

### Pass arguments for run
you can use env variable `felix_version`
docker run [...] -e felix_version="5.4.0"