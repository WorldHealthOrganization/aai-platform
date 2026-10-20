#!/usr/bin/env bash
# Put the beans branch at .state/ so the beans CLI (see .beans.yml) can read and write it.
# Commit and push from inside .state/ to record a change; no pull request is needed.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
branch=cat/aai-platform/beans
git fetch -q origin "$branch"
if [ -d .state ]; then
  git -C .state pull -q --ff-only origin "$branch"
else
  git worktree add -q -B "$branch" .state "origin/$branch"
fi
echo "beans branch mounted at .state/ ($(git -C .state rev-parse --short HEAD))"
