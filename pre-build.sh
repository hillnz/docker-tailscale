#!/bin/bash

set -e

git clone https://github.com/tailscale/tailscale.git
cd tailscale
git checkout "${{ env.TAILSCALE_VERSION }}"
eval $(./build_dist.sh shellvars)
echo "::set-output name=VERSION_LONG::${VERSION_LONG}"
echo "::set-output name=VERSION_SHORT::${VERSION_SHORT}"
echo "::set-output name=VERSION_GIT_HASH::${VERSION_GIT_HASH}"
cp ../entrypoint.sh ./
cat ../Dockerfile.entrypoint >>Dockerfile
