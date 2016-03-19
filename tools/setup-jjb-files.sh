#!/bin/bash -e

cd /tmp
cat > slack.xml <<EOF
<jenkins.plugins.slack.SlackNotifier plugin="slack@1.8.1">
  <teamDomain>a10networks</teamDomain>
  <authToken>foobar</authToken>
  <buildServerUrl>http://area51:8080/</buildServerUrl>
  <room></room>
</jenkins.plugins.slack.SlackNotifier>
EOF
sudo cp slack.xml /etc
