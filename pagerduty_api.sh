#!/bin/bash

# get users
subdomain_url='https://*********.pagerduty.com/api/v1/users'
token='*****************'

curl $subdomain_url \
-X GET -G \
-sH "Content-type: application/json" \
-H "Authorization: Token token=$token" \
--data-urlencode "include[]=contact_methods" --data-urlencode "include[]=notification_rules" --data-urlencode "limit=50" \
| jq '.users[] | [.name, (.contact_methods[] | .address)]'

