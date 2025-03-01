#!/bin/bash
# Assume TEMP_EC2_IP is exported as an environment variable
URL="http://${TEMP_EC2_IP}"

# Use curl to send the GET request and capture the HTTP status code
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$HTTP_CODE" -eq 200 ]; then
  echo "✅ Received 200 OK from ${URL}"
  exit 0
else
  echo "❌ Expected 200 OK but got ${HTTP_CODE} from ${URL}"
  exit 1
fi
