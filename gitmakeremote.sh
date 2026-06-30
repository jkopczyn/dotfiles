#!/bin/bash
# Create a GitHub repo for the current directory and wire up the origin remote.
# Uses the gh CLI's existing authenticated session (gh auth login) rather than
# raw curl basic auth, which GitHub no longer accepts (causes a 401).
set -euo pipefail

name="${1:-${PWD##*/}}"

git init
gh repo create "$name" --private --source=. --remote=origin
echo "success!"
