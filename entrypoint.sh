#!/bin/sh
set -e

if [ ! -f Gemfile ]; then
  echo "ERROR - no Gemfile found!"
  echo "Check your volume mounts or make sure there's a Jekyll site in this directory."
  echo ""
  echo "docker run -it --rm --volume="$PWD:/work" -p 4000:4000 ghcr.io/some-natalie/jekyll-in-a-can:latest"
  exit 1
fi

bundle install --retry 5 --jobs 20

exec "$@"
