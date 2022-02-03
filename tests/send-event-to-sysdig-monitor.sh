#!/bin/bash
SDC_ACCESS_TOKEN='YOUR-SYSDIG-ACCESS-TOKEN'
ENDPOINT='eu1.app.sysdig.com'

curl -X POST -s https://'"${ENDPOINT}"'/api/v2/events -H 'Content-Type: application/json; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H "Authorization: Bearer ${SDC_ACCESS_TOKEN}" --data-binary '{"event": {"name": "Jenkins - start wordpress deploy", "description": "deploy", "severity": "MEDIUM", "scope": "host.hostName = \"ip-10-1-1-1\" and build = \"89\""}}}'
sleep 5s

curl --location --request POST 'https://'${ENDPOINT}'/api/v2/events' \
--header 'Accept:  application/json, text/javascript, */*' \
--header 'Content-Type:  application/json; charset=UTF-8' \
--header 'Authorization:  Bearer '${SDC_ACCESS_TOKEN}'' \
--data-raw '{
    "event": {
        "name": "Blocked or non-compliant image detected in namespace",
        "description": "Image Signing and Verification",
        "severity": "MEDIUM",
        "scope": "host.hostName = \"ip-10-1-1-1\""
    }
}
}'