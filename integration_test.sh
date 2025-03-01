#!/bin/bash
URL="http://${TEMP_EC2_IP}"
max_attempts=10
attempt=1
success=0

while [ $attempt -le $max_attempts ]; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
  if [ "$HTTP_CODE" -eq 200 ]; then
    echo "✅ Received 200 OK from ${URL} on attempt $attempt"
    success=1
    break
  else
    echo "Attempt $attempt: Expected 200 OK but got ${HTTP_CODE}. Retrying in 10 seconds..."
    sleep 10
    attempt=$((attempt+1))
  fi
done

if [ $success -eq 1 ]; then
  exit 0
else
  echo "❌ Failed to receive 200 OK after $max_attempts attempts."
  exit 1
fi
