# Dotfiles with chezmoi

This repository is managed by [chezmoi](https://www.chezmoi.io/).

## Quick Start

### Install chezmoi

```bash
brew install chezmoi
```

### Initialize on a new machine

```bash
chezmoi init <your-git-user>/<your-dotfiles-repo>
chezmoi apply -v
```

If your repo is private:

```bash
chezmoi init git@github.com:<your-git-user>/<your-dotfiles-repo>.git
chezmoi apply -v
```

## Daily Workflow

### Edit a managed file

```bash
chezmoi edit ~/.tmux.conf
```

### See pending changes

```bash
chezmoi diff
chezmoi status
```

### Apply changes to home directory

```bash
chezmoi apply -v
```

### Add an existing file under management

```bash
chezmoi add ~/.config/fish/config.fish
```

## Git Sync

chezmoi uses a normal Git repo in its source directory.

```bash
chezmoi git status
chezmoi git add .
chezmoi git commit -m "Update dotfiles"
chezmoi git push
```

## Useful Commands

```bash
chezmoi source-path   # where the source repo lives
chezmoi cd            # open shell in source directory
chezmoi doctor        # environment checks
chezmoi update        # pull + apply (if configured)
```

## Secrets

Do not commit plain-text secrets. Use one of:

- `chezmoi` templates with external secret managers
- encrypted files (age/gpg)
- machine-local files excluded from source control

