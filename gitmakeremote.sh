#!/bin/bash
response=$(curl -u 'jkopczyn' https://api.github.com/user/repos -d "{\"name\":\"${1:-${PWD##*/}}\"}" -w "%{http_code}" --output "/dev/null";)
printf "%s\n" "$response"
if [ "201" == "$response" ]
then
    git init;
    git remote add origin git@github.com:jkopczyn/${1:-${PWD##*/}}.git;
    echo "success!"
fi
