#!/bin/bash

# run lint and tests first
npm run lint
CI=true npm test -- --coverage

# make sure working index is clean
stash_output=$(git stash)

# remove `build` directory
npm run clean

# build production bundle
npm run build

# deploy contents in `build` to remote branch `gh-pages`
if [[ $(command -v npx) ]]; then
  npx --no-install gitploy build gh-pages
else
  $(npm bin)/gitploy build gh-pages
fi

# pop saved stash (if applicable)
if [[ $stash_output != 'No local changes to save' ]]; then
  git stash pop
fi
