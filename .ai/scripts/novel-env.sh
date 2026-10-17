#!/usr/bin/env bash
# novel-env.sh — resolve the active novel project, clone- and worktree-agnostic.
#
# Works the same whether this repo is checked out as:
#   1. a normal clone          (one working dir; switch branches with `git checkout`)
#   2. a bare repo + worktrees (each novel branch lives in its own folder)
#
# Usage:
#   .ai/scripts/novel-env.sh [project-name]          # prints KEY=VALUE lines
#   source .ai/scripts/novel-env.sh [project-name]   # exports the same variables
#
# Resolution order for the novel:
#   1. explicit argument
#   2. current branch (branch name == folder name), unless it's `main`
#   3. .ai/.current_project (legacy hint)

_sourced=0
[ "${BASH_SOURCE[0]}" != "$0" ] && _sourced=1
[ "$_sourced" -eq 0 ] && set -u

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || {
  echo "Error: not inside a git working tree (clone or worktree)." >&2
  return 1 2>/dev/null || exit 1
}

CURRENT_BRANCH="$(git branch --show-current 2>/dev/null || true)"

NOVEL="${1:-}"

if [ -z "$NOVEL" ] && [ -n "$CURRENT_BRANCH" ] && [ "$CURRENT_BRANCH" != "main" ] \
   && [ -d "$REPO_ROOT/$CURRENT_BRANCH" ]; then
  NOVEL="$CURRENT_BRANCH"
fi

if [ -z "$NOVEL" ]; then
  NOVEL="$(cat "$REPO_ROOT/.ai/.current_project" 2>/dev/null || true)"
fi

if [ -z "$NOVEL" ]; then
  echo "Error: no novel project selected. Pass a project name, or run /write-novel-use first." >&2
  return 1 2>/dev/null || exit 1
fi

worktree_for_branch() {
  git worktree list --porcelain 2>/dev/null \
    | awk -v t="refs/heads/$1" '$1=="worktree"{w=substr($0,10)} $1=="branch" && $2==t{print w}'
}

# Working tree (main or linked) where this novel's branch is checked out, if any.
NOVEL_WORKTREE="$(worktree_for_branch "$NOVEL")"

# Working tree where `main` is checked out (for editing skills/commands).
MAIN_WORKTREE="$(worktree_for_branch main)"

if [ -n "$NOVEL_WORKTREE" ]; then
  NOVEL_DIR="$NOVEL_WORKTREE/$NOVEL"
else
  NOVEL_DIR="$REPO_ROOT/$NOVEL"
fi

export REPO_ROOT NOVEL NOVEL_DIR NOVEL_WORKTREE MAIN_WORKTREE

if [ "$_sourced" -eq 0 ]; then
  printf 'REPO_ROOT=%s\nNOVEL=%s\nNOVEL_DIR=%s\nNOVEL_WORKTREE=%s\nMAIN_WORKTREE=%s\n' \
    "$REPO_ROOT" "$NOVEL" "$NOVEL_DIR" "$NOVEL_WORKTREE" "$MAIN_WORKTREE"
fi
unset _sourced
unset -f worktree_for_branch
