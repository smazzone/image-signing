#!/bin/bash
SDC_ACCESS_TOKEN='c09cefa5-7bd7-4b87-a430-ccee645a5884'
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

# curl --location --request POST 'https://'${ENDPOINT}'/api/v2/events' \
# --header 'Accept:  application/json, text/javascript, */*' \
# --header 'Content-Type:  application/json; charset=UTF-8' \
# --header 'Authorization:  Bearer '${SDC_ACCESS_TOKEN}'' \
# --data-raw '{
#     "events": [
#         {
#             "timestamp": "2021-11-08T13:44:05+00:00",
#             "rule": "Check image signature",
#             "priority": "warning",
#             "output": "The image signature verification failed for image {{imagename}}",
#             "source": "Connaisseur AC",
#             "tags": [
#                 "foo",
#                 "bar"
#             ],
#             "output_fields": {
#                 "field1": "value1",
#                 "field2": "value2"
#             }
#         }
#     ],
#     "labels": {
#         "label1": "label1-value",
#         "label2": "label2-value"
#     }
# }
# }'


