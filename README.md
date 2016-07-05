[![Docker Stars](https://img.shields.io/docker/stars/andromedarabbit/newrelic-mysql-plugin.svg?style=flat-square)](https://hub.docker.com/r/andromedarabbit/newrelic-mysql-plugin/)
[![Docker Pulls](https://img.shields.io/docker/pulls/andromedarabbit/newrelic-mysql-plugin.svg?style=flat-square)](https://hub.docker.com/r/andromedarabbit/newrelic-mysql-plugin/)


# Dockerized NewRelic MySQL Plugin

This is Dockerized version of NewRelic MySQL Plugin. This is different from NewRelic's official [newrelic/dockerized-mysql-plugin](https://github.com/newrelic/dockerized-mysql-plugin). With [newrelic/dockerized-mysql-plugin](https://github.com/newrelic/dockerized-mysql-plugin), you need to run a new Docker container for an additional MySQL instance. With this, however, you don't need to. You just need your own customized [`plugin.json` for NewRelic MySQL Plugin](https://github.com/newrelic-platform/newrelic_mysql_java_plugin):

```json
/* ./data/nrmysql.plugin.json */
{
  "agents": [
    {
      "name"    : "Master",
      "host"    : "db.master.com",
      "metrics" : "status,newrelic,buffer_pool_stats,innodb_metrics,innodb_mutex,innodb_status,master",
      "user"    : "root",
      "passwd"  : "YOUR_PASSWORD"
    },
    {
      "name"    : "Slave",
      "host"    : "db.slave.com",
      "metrics" : "status,newrelic,buffer_pool_stats,innodb_metrics,innodb_mutex,innodb_status,slave",
      "user"    : "root",
      "passwd"  : "YOUR_PASSWORD"
    },
  ]
}
```

Now just pull the image and run it:

```yml
version: '2'
services:
  newrelic:
    image: andromedarabbit/newrelic-mysql-plugin
    environment:
      LICENSE_KEY: YOUR_KEY
    volumes:
      - ./data:/data
    restart: always
```
