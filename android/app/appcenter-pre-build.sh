#!/bin/bash
cd ${APPCENTER_SOURCE_DIRECTORY}
echo “DEV_URL=${DEV_URL}” > .env
echo “QA_URL=${QA_URL}” >> .env
echo “DEMO_URL=${DEMO_URL}” >> .env