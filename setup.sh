#!/bin/bash -eu

REPOS=(auction_db auction_api contract_api admin_web)
BRANCHES=(master develop master develop)
REPO_URL=https://gitlab.com/ylab-bc/2019/surplus-power-market/
INIT_DIR=$PWD

for ((i = 0; i < 4; i++)); do
  if [ -d "${REPOS[$i]}" ]; then
    cd ${REPOS[$i]}
    git fetch -p
    git checkout -q ${BRANCHES[$i]}
    latest_rev=$(git ls-remote origin HEAD | awk '{print $1}')
    current_rev=$(git rev-parse HEAD)
    if [ "$latest_rev" != "$current_rev" ]; then
      git reset --hard $(git log --pretty=format:%H | tail -1)
      git pull
    fi
  else
    git clone "$REPO_URL${REPOS[$i]}.git"
    cd ${REPOS[$i]}
  fi
  echo ""

  if [ -f package.json ]; then
    yarn
    echo ""
  fi

  cd $INIT_DIR
done

echo "Successfully Updated All Repository!"
