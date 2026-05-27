# Checkout a PR as a worktree
# Usage: cpr <PR_NUMBER>
ghpr() {
  local pr_number=$1
  local branch="pr-${pr_number}"
  gh pr checkout "$pr_number" -b "$branch"
  git switch -        # go back to previous branch
  git worktree add "../${branch}" "$branch"
  cd "../${branch}"
}
