#!/bin/sh
#	snikolov@influxtechnology.com

DEVICE_TYPE="imx8mnea-ucom"
TENANT_TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW5kZXIudGVuYW50IjoiNjA1YWU0ZGUwNmUxOGQ0OTcyMGMzOGVjIiwiaXNzIjoiTWVuZGVyIiwic3ViIjoiNjA1YWU0ZGUwNmUxOGQ0OTcyMGMzOGVjIn0.A9LeNrCIl2NWqhnW54BwDQaVdM7w6kU9QZEOrlckK_kLZsl3-JLbbKyt2jW6RDFVwIM8prlvNqYo301X-51gpq_16G2scp8ozmIgebt5z0HWQE56yo6rz4Pihq9ehf_I7RcCGG9hbDCqfFlKznIAyq-pCoGlXDjxQWz4DDLPeJeNUU3Vj-4ofOjI_gv3uEguTSWQF-yKSOuSFIYC9hpS2Qj6RpE5hz215FcqDsoSrRZghqRrVf2ipGMvCY0tyrnNywbAT84jPrD7e38xA7D43ERwdvrvhvqp70i7EkBG0tDo1OcpqG3KCwpnC-WDRndxVnp0m6Ighno0sbkgfPTRDSMl_3dNjYPMkbR1HpZzOy7rNeOfwlRRbcFzYzaH0U6qse56WqeVR3DMeNWsPVlfaLE1_c_q8x5WLGna0On6tZWseIHla5Iq9eo4B-TpwQitl1VemkmYFX_M03duIQ3bUJ3MMyHGllXSPfR2DTFKZgrUFZFWKkkTP1tv7x3Bwxwo"
/usr/bin/mender --log-file /data/mender/log setup \
  --device-type $DEVICE_TYPE \
  --hosted-mender \
  --tenant-token $TENANT_TOKEN \
  --retry-poll 30 \
  --update-poll 5 \
  --inventory-poll 5 && \
/bin/systemctl restart mender-client && \
/bin/systemctl restart mender-connect 
