#!/bin/bash

# make sure working index is clean
stash_output=$(git add . && git stash)

# run lint and tests first
npm run lint && npm test

# remove `build` directory and build production bundle
npm run clean && npm run build

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
