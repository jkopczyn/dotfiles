#!/bin/bash
# Table-driven tests for the identity-map logic shared by the git hooks.
# Run: git-hooks/test/test-identity.sh
set -u

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$here/../lib-identity.sh"

# Point the lib at the fixture instead of the real per-machine map.
export GIT_IDENTITY_MAP="$here/fixtures/identities"

fail=0
assert_eq() {
  local desc="$1" expected="$2" actual="$3"
  if [ "$expected" = "$actual" ]; then
    echo "ok   - $desc"
  else
    echo "FAIL - $desc"
    echo "        expected: [$expected]"
    echo "        actual:   [$actual]"
    fail=1
  fi
}

# --- identity_expected_email -------------------------------------------------
assert_eq "alt host matches secondary" \
  "secondary@example.com" \
  "$(identity_expected_email 'git@althost:alt-org/site.git')"

assert_eq "alt org name matches secondary" \
  "secondary@example.com" \
  "$(identity_expected_email 'https://example.com/alt-org/site.git')"

assert_eq "primary host+org matches primary" \
  "primary@example.com" \
  "$(identity_expected_email 'git@mainhost.com:main-user/dotfiles.git')"

assert_eq "unknown remote yields empty" \
  "" \
  "$(identity_expected_email 'git@gitlab.com:someone/x.git')"

assert_eq "empty remote yields empty" \
  "" \
  "$(identity_expected_email '')"

# --- identity_other_emails ---------------------------------------------------
assert_eq "other emails excludes the expected one" \
  "secondary@example.com" \
  "$(identity_other_emails 'primary@example.com')"

assert_eq "other emails for secondary excludes secondary" \
  "primary@example.com" \
  "$(identity_other_emails 'secondary@example.com')"

# --- missing map -------------------------------------------------------------
GIT_IDENTITY_MAP="$here/fixtures/does-not-exist" \
  assert_eq "missing map yields empty expected" \
  "" \
  "$(GIT_IDENTITY_MAP="$here/fixtures/does-not-exist" identity_expected_email 'git@mainhost.com:main-user/x.git')"

exit $fail
