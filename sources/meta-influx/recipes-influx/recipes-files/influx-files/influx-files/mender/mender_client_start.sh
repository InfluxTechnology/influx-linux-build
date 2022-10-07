#!/bin/sh

DEVICE_TYPE="imx8mmea-ucom"
TENANT_TOKEN=""
/usr/bin/mender --log-file /data/mender/log setup \
  --device-type $DEVICE_TYPE \
  --hosted-mender \
  --tenant-token $TENANT_TOKEN \
  --retry-poll 30 \
  --update-poll 5 \
  --inventory-poll 5 && \
/bin/systemctl restart mender-client && \
/bin/systemctl restart mender-connect 
