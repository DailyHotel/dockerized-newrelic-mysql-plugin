#!/bin/bash
set -eo pipefail

cd /root/newrelic-npi

./npi config set license_key ${LICENSE_KEY} && ./npi install nrmysql --user=root --quiet --yes --noedit

if [ -f /data/nrmysql.plugin.json ];
then
 cp -f /data/nrmysql.plugin.json /root/newrelic-npi/plugins/com.newrelic.plugins.mysql.instance/newrelic_mysql_plugin-2.0.0/config/plugin.json
fi

exec "$@"
