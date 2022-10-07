#!/bin/sh
#	pave2GBmini@influxtechnology.com

DEVICE_TYPE="imx8mmea-ucom"
TENANT_TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW5kZXIudGVuYW50IjoiNjIwZTZhZWVkYzAwM2EzOTgyZGQ3NmJhIiwiaXNzIjoiTWVuZGVyIiwic3ViIjoiNjIwZTZhZWVkYzAwM2EzOTgyZGQ3NmJhIn0.DTkQtx4jRArIt41FuYkMLVv_HVaLHLtotWGlSa84IV9jOr2ixb0dmAMQXzEycWrkVMtw7Bx5ACwZLGaBrjTTu0X_lcA5PxYmBqYNpkwjj415W3kgAku32lhaREUVtszYY10XgO0ad1wl9lhjqG3XcATAwSbu10yP4xcHZrLZ4pRHPORMM-ZfI9Q1Zr8sUZommU2jLRzNtP6ho1lvisllymffHY39T52oCpWkvHsSS48pzioSMBA5YUdmYygJfthY-PKuRtKyVyrQxhKTRZiXLW_IQkXPDXudD0pWQZ0AQeqkuuCPXe_cBc8JN-gXdO_ntJgK4rWLs6BjI9IYF9IsZuP2xyyM2kAJ-VnZR9Yx2keEULRuYYygl0Pn6L20CvpMccRS3rOzx-TGQJW67J_FRr5f6iAoGMgBW0VShXYymtZG5TPw1dcM4LzcZGz4V1jm7CD5x5WUSCgftEj3-aWrfIuA9k1JR2iKp9R3-uEp6ddBQs984R6oUJYV-jgVhU1V"
/usr/bin/mender --log-file /data/mender/log setup \
  --device-type $DEVICE_TYPE \
  --hosted-mender \
  --tenant-token $TENANT_TOKEN \
  --retry-poll 30 \
  --update-poll 5 \
  --inventory-poll 5 && \
/bin/systemctl restart mender-client && \
/bin/systemctl restart mender-connect 
