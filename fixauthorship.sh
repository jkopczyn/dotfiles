#!/bin/bash
if [ $# -ge 1 ]
then
git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Jacob Kopczynski & $1'; GIT_AUTHOR_EMAIL='ja.kopczynski@gmail.com'; GIT_COMMITTER_NAME='Jacob Kopczynski'; GIT_COMMITTER_EMAIL='\'${2:-"'ja.kopczynski@gmail.com'"}\'';" HEAD
else
git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Jacob Kopczynski'; GIT_AUTHOR_EMAIL='ja.kopczynski@gmail.com'; GIT_COMMITTER_NAME='Jacob Kopczynski'; GIT_COMMITTER_EMAIL='ja.kopczynski@gmail.com';" HEAD
fi

