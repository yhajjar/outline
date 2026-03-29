#!/bin/sh
set -e

# Auto-generate SECRET_KEY if not set or is placeholder
if [ -z "$SECRET_KEY" ] || [ "$SECRET_KEY" = "generate_a_new_key" ]; then
  export SECRET_KEY=$(node -e "process.stdout.write(require('crypto').randomBytes(32).toString('hex'))")
  echo "[entrypoint] Generated SECRET_KEY automatically"
fi

# Auto-generate UTILS_SECRET if not set or is placeholder
if [ -z "$UTILS_SECRET" ] || [ "$UTILS_SECRET" = "generate_a_new_key" ]; then
  export UTILS_SECRET=$(node -e "process.stdout.write(require('crypto').randomBytes(32).toString('hex'))")
  echo "[entrypoint] Generated UTILS_SECRET automatically"
fi

exec "$@"
