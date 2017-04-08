#!/bin/bash

token='8ik7CGa************'
subdomain_url='https://*******.pagerduty.com/api/v1/users'

curl -sH "Content-type: application/json" -H "Authorization: Token token=$token" -X GET -G --data-urlencode "include[]=contact_methods" --data-urlencode "include[]=notification_rules" --data-urlencode "limit=50" $subdomain_url | jq '.users[] | [.name, (.contact_methods[] | .address)]'