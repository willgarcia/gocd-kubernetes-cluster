# docker-gocd

Docker images to run:
* a GoCD server with [pipelines as code](https://docs.gocd.io/current/advanced_usage/pipelines_as_code.html), repeatable/preservable configuration and minimum [backup](https://docs.gocd.io/current/installation/upgrading_go.html) management
* GoCD agent(s) with master [auto-registration](https://docs.gocd.io/current/advanced_usage/agent_auto_register.html)
* Run Docker-in-Docker on the GoCD agent(s)

## Docker images

These images are not official GoCD images. Please, refer to the [Docker hub GoCD page](https://hub.docker.com/u/gocd/) for the officially maintained images.

- willgarcia/gocd-server [`latest`/`1` (*Dockerfile*)](https://github.com/willgarcia/docker-gocd/blob/master/server/Dockerfile) [![](https://images.microbadger.com/badges/version/willgarcia/gocd-server.svg)](http://microbadger.com/images/willgarcia/gocd-server "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/willgarcia/gocd-server.svg)](http://microbadger.com/images/willgarcia/gocd-server "Get your own image badge on microbadger.com")
- willgarcia/gocd-agent [`latest`/`1` (*Dockerfile*)](https://github.com/willgarcia/docker-gocd/blob/master/agent/Dockerfile) [![](https://images.microbadger.com/badges/version/willgarcia/gocd-agent.svg)](http://microbadger.com/images/willgarcia/gocd-agent "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/willgarcia/gocd-agent.svg)](http://microbadger.com/images/willgarcia/gocd-agent "Get your own image badge on microbadger.com")
- willgarcia/gocd-server-backup [`latest`/`1` (*Dockerfile*)](https://github.com/willgarcia/docker-gocd/blob/master/server-backup/Dockerfile) [![](https://images.microbadger.com/badges/version/willgarcia/gocd-server-backup.svg)](http://microbadger.com/images/willgarcia/gocd-server-backup "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/willgarcia/gocd-server-backup.svg)](http://microbadger.com/images/willgarcia/gocd-server-backup "Get your own image badge on microbadger.com")
- willgarcia/dind [`latest`/`1` (*Dockerfile*)](https://github.com/willgarcia/docker-gocd/blob/master/dind/Dockerfile) [![](https://images.microbadger.com/badges/version/willgarcia/dind.svg)](http://microbadger.com/images/willgarcia/dind "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/willgarcia/dind.svg)](http://microbadger.com/images/willgarcia/dind "Get your own image badge on microbadger.com")

## Usage

Development only.

```
$ docker-compose up
```

Visit https://localhost:8154.

## Tests

```
$ bash test/gocd_test.sh
```
