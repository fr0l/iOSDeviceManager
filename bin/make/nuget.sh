#!/usr/bin/env bash

set -e

source bin/log_functions.sh

DEP_STAGING_DIR=Distribution/dependencies
NUGET_DIR=Distribution/DeviceAgent.iOS.Deployment
DEP_ZIP=dependencies.zip
VERSION=`cat Distribution/version.txt`
CURRENT_DIR=$PWD

rm -f "${NUGET_DEP_ZIP}"

/usr/bin/find ${DEP_STAGING_DIR} -type f -exec /sbin/md5 {} + \
  | /usr/bin/awk '{print $4}' \
  | /usr/bin/sort \
  | /sbin/md5 \
  > "${NUGET_DIR}/hash.txt"

info "Zipping up dependencies"

xcrun ditto -ck --rsrc --sequesterRsrc \
    "${DEP_STAGING_DIR}" \
    "${NUGET_DIR}/${DEP_ZIP}"

cd "${NUGET_DIR}"

info "Building Nuget package"

dotnet version "${VERSION}" > /dev/null
dotnet restore >/dev/null
dotnet pack -c Release > /dev/null

cd "${CURRENT_DIR}"

info "Built Nuget package ${NUGET_DIR} v${VERSION}"
