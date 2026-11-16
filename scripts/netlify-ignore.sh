#!/usr/bin/env bash
set -eu

# Netlify should rebuild only when website source files change.
# Eitaa publisher code and GitHub Actions workflow changes must not redeploy the site.

if [ -z "${CACHED_COMMIT_REF:-}" ] || [ -z "${COMMIT_REF:-}" ]; then
  echo "No previous deploy reference available; building the site safely."
  exit 1
fi

if git diff --quiet "$CACHED_COMMIT_REF" "$COMMIT_REF" -- '*.html' '*.js' '*.css' 'assets/**' 'public/**'; then
  echo "No website source changes detected. Skipping Netlify build."
  exit 0
fi

echo "Website source changes detected. Building the site."
exit 1
