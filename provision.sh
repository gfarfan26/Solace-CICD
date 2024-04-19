#!/bin/bash

SOLACE_IP=mr-connection-6dy5nbravi1.messaging.solace.cloud:55443
CRED=solace-cloud-client:o34a1l78co36tvsa3pkkdilucb

CREATE_VPN="
<rpc semp-version="soltr/7_1_1">
<create>
<message-vpn>
<vpn-name>Solace-CICD</vpn-name>
</message-vpn>
</create>
</rpc>
"
START_VPN="
<rpc semp-version="soltr/7_1_1"
<message-vpn>
<vpn-name>Solace-CICD</vpn-name>
<no>
<shutdown></shutdown>
</no>
</message-vpn>
</rpc>
"

echo "${CREATE_VPN}" | curl -d @- -u "${CRED}" http://${SOLACE_IP}/SEMP
echo "${START_VPN}" | curl -d @- -u "${CRED}" http://${SOLACE_IP}/SEMP

