# Shared identity-map logic for the git hooks.
#
# The per-machine map lives OUTSIDE this repo (untracked) so no account-specific
# email or org ever gets committed/published. Format, one rule per line:
#
#   <extended-regex matched against the remote URL><TAB><email>
#
# Lines that are blank or start with '#' are ignored. First matching rule wins.
# Override the path with $GIT_IDENTITY_MAP (used by the tests).

identity_map_path() {
  printf '%s\n' "${GIT_IDENTITY_MAP:-$HOME/.config/git/identities}"
}

# identity_expected_email <remote_url> -> the email that remote requires (or "")
identity_expected_email() {
  local remote_url="$1" map pattern email
  map="$(identity_map_path)"
  [ -f "$map" ] || return 0
  [ -n "$remote_url" ] || return 0

  while IFS=$'\t' read -r pattern email; do
    case "$pattern" in ''|\#*) continue ;; esac
    if printf '%s' "$remote_url" | grep -Eq -- "$pattern"; then
      printf '%s\n' "$email"
      return 0
    fi
  done < "$map"
}

# identity_other_emails <expected_email> -> every mapped email except the given
# one, deduplicated, one per line. Used by pre-push to detect leaked identities.
identity_other_emails() {
  local expected="$1" map pattern email
  map="$(identity_map_path)"
  [ -f "$map" ] || return 0

  while IFS=$'\t' read -r pattern email; do
    case "$pattern" in ''|\#*) continue ;; esac
    [ -n "$email" ] || continue
    [ "$email" = "$expected" ] && continue
    printf '%s\n' "$email"
  done < "$map" | sort -u
}
