#!/bin/bash
SECURE_API_TOKEN='c09cefa5-7bd7-4b87-a430-ccee645a5884'
ENDPOINT='eu1.app.sysdig.com'

curl --location --request POST 'https://'${ENDPOINT}'/api/v1/eventsDispatch/ingest' \
--header 'Accept:  application/json, text/javascript, */*' \
--header 'Content-Type:  application/json; charset=UTF-8' \
--header 'Authorization:  Bearer '${SECURE_API_TOKEN}'' \
--data-raw '{
    "events": [
        {
            "timestamp": "2021-11-08T13:44:05+00:00",
            "rule": "Check image signature",
            "priority": "warning",
            "output": "The image signature verification failed for image {{imagename}}",
            "source": "Connaisseur AC",
            "tags": [
                "foo",
                "bar"
            ],
            "output_fields": {
                "field1": "value1",
                "field2": "value2"
            }
        }
    ],
    "labels": {
        "label1": "label1-value",
        "label2": "label2-value"
    }
}
'