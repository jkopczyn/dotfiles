#!/bin/bash
# Integration smoke test: drive the real hook scripts inside a throwaway repo.
# Run: git-hooks/test/test-hooks-integration.sh
set -u

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
hooks="$(cd "$here/.." && pwd)"
export GIT_IDENTITY_MAP="$here/fixtures/identities"

fail=0
report() { # <desc> <expected-exit> <actual-exit>
  if [ "$2" = "$3" ]; then echo "ok   - $1"; else
    echo "FAIL - $1 (expected exit $2, got $3)"; fail=1; fi
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
cd "$tmp" || exit 1
git init -q
git config core.hooksPath "$hooks"
git remote add origin "git@mainhost.com:main-user/dotfiles.git"  # -> primary@example.com

# pre-commit: wrong identity is rejected, correct identity passes.
git config user.email "secondary@example.com"
git config user.name "Test"
echo a > a.txt && git add a.txt
git commit -q -m "wrong identity" 2>/dev/null
report "pre-commit blocks wrong identity" 1 $?

git config user.email "primary@example.com"
git commit -q -m "right identity"
report "pre-commit allows correct identity" 0 $?

# pre-push: a commit authored by the other identity is caught.
# Build the push stdin line the hook reads: <local_ref> <local_oid> <remote_ref> <remote_oid>
git config user.email "secondary@example.com"
echo b > b.txt && git add b.txt
GIT_COMMITTER_EMAIL="secondary@example.com" git commit -q --no-verify -m "leaked"
leaked_oid=$(git rev-parse HEAD)
zero=0000000000000000000000000000000000000000
echo "refs/heads/main $leaked_oid refs/heads/main $zero" \
  | "$hooks/pre-push" origin >/dev/null 2>&1
report "pre-push blocks leaked identity" 1 $?

# A clean range (only the primary-authored commit) pushes fine.
git config user.email "primary@example.com"
git reset -q --hard HEAD~1
clean_oid=$(git rev-parse HEAD)
echo "refs/heads/main $clean_oid refs/heads/main $zero" \
  | "$hooks/pre-push" origin >/dev/null 2>&1
report "pre-push allows clean history" 0 $?

# Fail-closed: a remote that matches no rule is rejected (forces a mapping).
git config user.email "primary@example.com"
git remote set-url origin "git@gitlab.com:someone/x.git"
echo c > c.txt && git add c.txt
git commit -q -m "unmapped remote" 2>/dev/null
report "pre-commit blocks unmapped remote (fail closed)" 1 $?

echo "refs/heads/main $clean_oid refs/heads/main $zero" \
  | "$hooks/pre-push" origin >/dev/null 2>&1
report "pre-push blocks unmapped remote (fail closed)" 1 $?

# Special case: a repo with no remote at all is allowed (scratch repo).
git remote remove origin
git commit -q -m "no remote, scratch repo"
report "pre-commit allows repo with no remote" 0 $?

exit $fail
