# scry — personal zsh theme
# Originally based on robbyrussell by Robbie Russell (https://github.com/robbyrussell/oh-my-zsh)
# Colors have been changed and a git worktree indicator has been added.
# Loaded from $ZSH_CUSTOM/themes/ (takes priority over $ZSH/themes/)
#
# Prompt format:  <dir> [wt:(<worktree>)] [git:(<branch>)[~]] ✦
# The wt:() segment only appears inside a git linked worktree.
# The ~ suffix on git:() indicates a dirty working tree.

# ── Semantic color tokens ─────────────────────────────────────────────────────
local c_primary="magenta"  # directory, worktree name, branch name
local c_secondary="white"  # git:/wt: labels, parens, diamond
local c_tertiary="yellow"  # dirty indicator ✗
# ─────────────────────────────────────────────────────────────────────────────

function custom_git_prompt() {
  local ref
  ref=$(command git symbolic-ref HEAD 2>/dev/null) || \
  ref=$(command git rev-parse --short HEAD 2>/dev/null) || return 0
  local branch="${ref#refs/heads/}"
  local dirty=""
  if [[ -n "$(command git status --porcelain 2>/dev/null)" ]]; then
    dirty="%{$fg[$c_tertiary]%}~"
  fi
  echo "%{$fg[$c_secondary]%}git:(%{$fg[$c_primary]%}${branch}%{$fg[$c_secondary]%})${dirty}%{$reset_color%} "
}

function git_worktree_info() {
  local toplevel
  toplevel=$(git rev-parse --show-toplevel 2>/dev/null) || return
  # Linked worktrees have a .git *file*, not a directory
  if [[ -f "$toplevel/.git" ]]; then
    echo "%{$fg[$c_secondary]%}wt:(%{$fg[$c_primary]%}${toplevel:t}%{$fg[$c_secondary]%})%{$reset_color%} "
  fi
}

PROMPT='%{$fg[$c_primary]%}%c%{$reset_color%} $(git_worktree_info)$(custom_git_prompt)%{$fg[$c_secondary]%}✦%{$reset_color%} '
