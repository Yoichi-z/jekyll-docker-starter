#!/usr/bin/env bash
set -Eeuo pipefail

cd /site

bundle config set path "$BUNDLE_PATH"
bundle config set jobs 4
bundle config set retry 3

if ! bundle check > /dev/null 2>&1; then
  echo "[entrypoint] Installing gems..."
  bundle install
fi

echo "[entrypoint] Starting Jekyll (livereload & polling for Windows/WSL)"
exec bundle exec jekyll serve \
  --host 0.0.0.0 \
  --livereload --livereload-port 35729 \
  --watch --force_polling
