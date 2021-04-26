#!/bin/sh
set -e

# Is docker available?
if ! type docker >/dev/null; then
  echo "Please install docker"
  exit 1
fi

echo "Running ..."

docker run --rm -i -t -e "VERSION_VIPS=8.10.6" -e VERSION_LATEST_REQUIRED -v $PWD:/packaging vips-dev-linux-x64 /bin/bash