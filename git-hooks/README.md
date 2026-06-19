# git-hooks

Identity-guard hooks that keep my two GitHub accounts from cross-contaminating:

- `pre-commit` — refuses to commit under the wrong `user.email` for the remote.
- `pre-push` — refuses to push commits authored under a different identity.

Enable them on a machine with:

```sh
git config --global core.hooksPath ~/dotfiles/git-hooks
```

## The untracked identity map (required per machine)

The hooks read the remote→email mapping from `~/.config/git/identities`, which
is **not** tracked here — that keeps account-specific addresses and org names
out of this public repo. Each machine needs its own copy. Format, one rule per
line (`#` comments and blank lines ignored, first match wins):

```
# <extended-regex matched against the remote URL><TAB><email>
althost:|alt-org	you+alt@example.com
github\.com:|your-user	you@example.com
```

**Policy:** a repo with **no remote** is allowed (scratch repos commit
freely). Any repo **with** a remote that resolves to no mapped identity is
**rejected** — a forgotten mapping or missing map file fails closed rather
than silently disabling the guard. Add a rule, or bypass once with
`--no-verify`. So provision `~/.config/git/identities` on every machine
before committing to remote-backed repos.

## Tests

```sh
git-hooks/test/run.sh
```
