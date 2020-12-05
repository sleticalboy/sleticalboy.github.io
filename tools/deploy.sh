#!/bin/bash
#
# Deploy the content of _site to 'origin/<pages_branch>'
#
# v2.5
# https://github.com/cotes2020/jekyll-theme-chirpy
# © 2020 Cotes Chung
# Published under MIT License

set -eu

PAGES_BRANCH="gh-pages"
_backup_dir="$(mktemp -d)"

init() {
  if [[ -z $(git branch -av | grep "$PAGES_BRANCH") ]]; then
    # 创建分支
    git checkout -b "$PAGES_BRANCH"
  else
    # 删除分支
    git push origin --delete "origin/$PAGES_BRANCH"
  fi

  # 创建分支
  git checkout -b "$PAGES_BRANCH"
}

backup() {
  mv _site/* "$_backup_dir"
  mv .git "$_backup_dir"

  # When adding custom domain from Github website,
  # the CANME only exist on `gh-pages` branch
  if [[ -f CNAME ]]; then
    mv CNAME "$_backup_dir"
  fi
}

flush() {
  rm -rf ./*
  rm -rf .[^.] .??*

  shopt -s dotglob nullglob
  mv "$_backup_dir"/* .
}

deploy() {
  git config user.name "GitHub Actions"
  git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

  git update-ref -d HEAD
  git add -A
  git commit -m "[Automation] Site update No.${GITHUB_RUN_NUMBER}"

  git push -u origin "$PAGES_BRANCH"
}

main() {
  init
  backup
  flush
  deploy
}

main
