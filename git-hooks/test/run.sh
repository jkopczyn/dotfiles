#!/bin/bash
# Run all git-hook tests.
set -e
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash "$here/test-identity.sh"
bash "$here/test-hooks-integration.sh"
