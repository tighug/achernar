#!/bin/bash

set -eu

CLONE_TO=auction_db
REPO_URL=https://gitlab.com/ylab-bc/2019/surplus-power-market/auction_db.git
BRANCH=master

if [ -d "$CLONE_TO" ]; then
  cd $CLONE_TO
  git fetch -p
  git checkout -q $BRANCH
  latest_rev=$(git ls-remote origin HEAD | awk '{print $1}')
  current_rev=$(git rev-parse HEAD)
  if [ "$latest_rev" != "$current_rev" ]; then
    git reset --hard $(git log --pretty=format:%H | tail -1)
    git pull
  fi
else
  git clone $REPO_URL $CLONE_TO
fi
