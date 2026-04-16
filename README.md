# dillon

A personal Oh My Zsh theme based on [robbyrussell](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme) by Robbie Russell. Colors have been tuned and a git worktree indicator has been added.

## Prompt

```
<dir> [wt:(<worktree>)] git:(<branch>)[~] ✦
```

- `wt:(...)` — only shown inside a [git linked worktree](https://git-scm.com/docs/git-worktree)
- `git:(branch)~` — the `~` suffix appears when the working tree is dirty
- Colors are controlled by three semantic tokens at the top of the theme file (`c_primary`, `c_secondary`, `c_tertiary`)

## Install

### Oh My Zsh

```bash
git clone https://github.com/dillon-wispr/dillon-zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dillon-zsh-theme
ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dillon-zsh-theme/dillon.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dillon.zsh-theme
```

Set the theme in `~/.zshrc`:

```zsh
ZSH_THEME="dillon"
```

Restart your shell or `source ~/.zshrc`.

## Customize

Open `dillon.zsh-theme` and edit the three color tokens near the top:

```zsh
local c_primary="magenta"  # directory, worktree name, branch name
local c_secondary="white"  # git:/wt: labels, parens, diamond
local c_tertiary="yellow"  # dirty indicator ~
```

Any named zsh color works: `red`, `blue`, `green`, `cyan`, `magenta`, `yellow`, `white`, `black`.

## Update

```bash
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dillon-zsh-theme && git pull
```
