#!/bin/bash
curl -u 'jkopczyn' https://api.github.com/user/repos -d "{\"name\":\"$1\"}";
git init;
git remote add origin git@github.com:jkopczyn/$1.git;
