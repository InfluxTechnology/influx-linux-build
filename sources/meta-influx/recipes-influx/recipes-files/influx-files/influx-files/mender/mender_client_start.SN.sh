#!/bin/sh
#	snikolov@influxtechnology.com

DEVICE_TYPE="imx8mnea-ucom"
TENANT_TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW5kZXIudGVuYW50IjoiNjBhNjY3MjU3OTZlOGVhMGNmODZjZDZiIiwiaXNzIjoiTWVuZGVyIiwic3ViIjoiNjBhNjY3MjU3OTZlOGVhMGNmODZjZDZiIn0.N7Fzl-2tDwASgWt9m7cy1g2K6_3Hr047ieEQzkwfDIfT5CKaTyhNeR1iH2MoxmJkm43G19uw9qGrqOrhCZFkSS72xLxAvWNWUg-UIDvuCVwBvHpYQh8Pji3rKFWtZ5_mrsqXpuyPdCSvUAP0ju36CRGXNhZkv9eAJoh8SuaN4ulnDhHnhRH_ng2zcYEMZNDIKneviqeIjcyF4HW6jLYG4qyvxf8D2AmfUZtefvpMtNXJ2S0Tvc1bwbB3KrhfDxUHwfd87YXvJjgcG7NdLCsEHdaUJ3Joy43XVwJRn95zNu2sTB7ZLUwg__RkaEohnUKWP5qVfo17QG36o16VRpQHhZBCY5rEUGMf8xehGhPUakg6XbqFym4a6DtbZKrMSJJj-rY7-wuTtXY08Y2ct-DG-7o0Hr6ufYnb0Tzq-A2epAUpbux3n28v8AcQD5P9W0jXF539BpXkUsM-LnXsyNatnlgmCEY0g86dqm51wbmWfCdyZEmeiQlVly4pEhIHUpoh"
/usr/bin/mender --log-file /data/mender/log setup \
  --device-type $DEVICE_TYPE \
  --hosted-mender \
  --tenant-token $TENANT_TOKEN \
  --retry-poll 30 \
  --update-poll 5 \
  --inventory-poll 5 && \
/bin/systemctl restart mender-client && \
/bin/systemctl restart mender-connect 
