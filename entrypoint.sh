#!/bin/sh -l

curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
ibmcloud login \
  -a https://cloud.ibm.com \
  -u apikey \
  -p $INPUT_CF-TOKEN \
  -o $INPUT_CF-ORG \
  -s $INPUT_CF-SPACE \
  -r $INPUT_CF-REGION
ibmcloud cf install
ibmcloud cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
ibmcloud cf install-plugin blue-green-deploy -f -r CF-Community
ibmcloud cf blue-green-deploy $INPUT_CF-APP -f ${INPUT_CF-MANIFEST:-manifest.yml} --delete-old-apps
