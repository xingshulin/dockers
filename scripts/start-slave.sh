#!/bin/bash

echo "Using jenkins @ $JENKINS_URL"

echo "Download jenkins-cli.jar"
curl -O "$JENKINS_URL/jnlpJars/jenkins-cli.jar"

nodeName=${NODE_NAME:=$HOSTNAME}
echo "Register container $nodeName as slave"
java -jar jenkins-cli.jar -s "$JENKINS_URL" create-node "$nodeName" --username $JENKINS_USER --password $JENKINS_PASSWORD << EOF
<slave>
    <name>$nodeName</name>
    <description>docker slave $nodeName for $NODE_LABEL</description>
    <remoteFS>/var/jenkins_slave/</remoteFS>
    <numExecutors>1</numExecutors>
    <mode>NORMAL</mode>
    <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
    <launcher class="hudson.slaves.JNLPLauncher"/>
    <label>$NODE_LABEL</label>
    <nodeProperties/>
</slave>
EOF

echo "Download slave.jar"
curl -O "$JENKINS_URL/jnlpJars/slave.jar"

echo "Connect slave to master"
java -jar slave.jar -jnlpCredentials "$JENKINS_USER:$JENKINS_PASSWORD" -jnlpUrl "$JENKINS_URL/computer/$nodeName/slave-agent.jnlp"

