#!/usr/bin/env bash
# This can accept an event and also utilize the payload from stdin.
# Generate an even via
# consul event -name echo Waqas

payload=`jq -r .[0].Payload | base64 --decode`
# echo "The payload in the even is: $payload"

logger -i -t CONSUL-EVENT -s An event has been logged by Consul with "payload=$payload"