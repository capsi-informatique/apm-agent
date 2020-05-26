#!/bin/sh
# Usage wget https://raw.githubusercontent.com/capsi-informatique/apm-agent/master/provision.sh && chmod u+x provision.sh && bash provision.sh

AGENT_VERSION=1.16.0
APM_DIR=/opt/apm

if [[ ! -e $APM_DIR ]]; then
	mkdir -p $APM_DIR
fi

if [[ ! -e  $APM_DIR/elastic-apm-agent-$AGENT_VERSION.jar ]]; then
	wget https://repo1.maven.org/maven2/co/elastic/apm/elastic-apm-agent/$AGENT_VERSION/elastic-apm-agent-$AGENT_VERSION.jar -P $APM_DIR
fi

wget https://raw.githubusercontent.com/capsi-informatique/apm-agent/master/elasticapm.properties -P $APM_DIR

echo Add following parameters to JVM option
echo "-javaagent:$APM_DIR/elastic-apm-agent-$AGENT_VERSION.jar -Delastic.apm.environment=prod -Delastic.apm.service_name=myapp"