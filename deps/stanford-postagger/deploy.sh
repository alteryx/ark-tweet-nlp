#!/bin/bash

if [ -z "$MAVEN_REPOSITORY_ID" ]; then
  echo "MAVEN_REPOSITORY_ID is not defined" >&2
  exit 1
fi
if [ -z "$MAVEN_REPOSITORY_URL" ]; then
  echo "MAVEN_REPOSITORY_URL is not defined" >&2
  exit 1
fi

set -e -u -o pipefail -x
cd `dirname $0`
mvn deploy:deploy-file \
  -Dfile=../../lib/stanford-postagger-2010-05-26.jar \
  -DpomFile=pom.xml \
  -DrepositoryId=$MAVEN_REPOSITORY_ID \
  -Durl=$MAVEN_REPOSITORY_URL

