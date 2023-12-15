#!/bin/bash

SERVER_IP="remote-server-ip"
PORTS=("3389" "22")

for PORT in "${PORTS[@]}"; do
  nc -z -w 1 "$SERVER_IP" "$PORT" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    if [ "$PORT" == "3389" ]; then
      echo "Remote server is likely running Windows."
    elif [ "$PORT" == "22" ]; then
      echo "Remote server is likely running Linux."
    fi
    exit 0
  fi
done

echo "Unable to determine the remote server type."
exit 1
