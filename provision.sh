#!/bin/sh
AGENT_VERSION=1.15.0
APM_DIR=/opt/apm

if [[ ! -e $APM_DIR ]]; then
	mkdir -p $APM_DIR
fi

if [[ ! -e  $APM_DIR/elastic-apm-agent-$AGENT_VERSION.jar ]]; then
	wget https://repo1.maven.org/maven2/co/elastic/apm/elastic-apm-agent/$AGENT_VERSION/elastic-apm-agent-$AGENT_VERSION.jar -P $APM_DIR
fi

wget -P https://github.com/capsi-informatique/apm-agent/elasticapm.properties -P $APM_DIR

echo Add following parameters to JVM option
echo "-javaagent:$APM_DIR/elastic-apm-agent-$AGENT_VERSION.jar 	-Delastic.apm.environment=prod -Delastic.apm.service_name=myapp"