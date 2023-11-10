#!/bin/bash

curl -H "Authorization: Bearer XL4V7" -X GET http://localhost:9863/query/track | jq '{ title, author }'
