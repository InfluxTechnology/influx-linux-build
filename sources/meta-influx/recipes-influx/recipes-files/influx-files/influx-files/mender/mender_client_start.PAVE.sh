#!/bin/sh
#	pavemender@influxtechnology.com

DEVICE_TYPE="imx8mmea-ucom"
TENANT_TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW5kZXIudGVuYW50IjoiNjFmODE3NWIxOWRjM2Q1NzFkMmRkMzVjIiwiaXNzIjoiTWVuZGVyIiwic3ViIjoiNjFmODE3NWIxOWRjM2Q1NzFkMmRkMzVjIn0.G10xLIrugFB9tMzzI_jQBm4U8YttQSCcO4WmAZQUGOFTG3whpcwZ94zrBcN1buu06GWc5p26wGT2u7UvkW2hURaFaE4ldbfqD_8ANMYDEr__Lv9g1wDNc0gkkrOwA9utpXCWeN-5Yf1M5C0TtNvH80VZUUYwxTkTohdsmzA66CFZcs18VSd9lxctdjn_f7jBKtTo2eRm5UPaKdcrbdEYegUCfZ8dCUFSX7bFLB5zHrM4ROyJZXKXm6lReYuWlY628ZofUpfracWqJHNhXwtZ-yws3PWk-DIaeRaoiqIHywRduvdM9L6NzAyci605z7eDy8MLBNuhu4FQNMjQbhYCO3756OLqMQTUFaoPwvF5IfckAmka9QhEJrqpvmvk-GSyoN4P5I8xabyGOxBSyc6KkMLWfaL7hCFNXJLo26dyPzJkTgM4SLTsvXc-1JYNyCCrWVyj4lvVwMyxQliL_3nRnCPB2_m6G4IXn9ONHKMxo9xRM-g9OIqsIC3oc5sYvUs5"
/usr/bin/mender --log-file /data/mender/log setup \
  --device-type $DEVICE_TYPE \
  --hosted-mender \
  --tenant-token $TENANT_TOKEN \
  --retry-poll 30 \
  --update-poll 5 \
  --inventory-poll 5 && \
/bin/systemctl restart mender-client && \
/bin/systemctl restart mender-connect 
