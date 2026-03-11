# disable fish greeting
set fish_greeting

if command -q zed
    set -gx EDITOR "zed --wait"
    set -gx VISUAL "zed --wait"
else if command -q code
    set -gx EDITOR "code --wait"
    set -gx VISUAL "code --wait"
end

set -x LC_ALL en_US.UTF-8
set -x VIRTUAL_ENV_DISABLE_PROMPT off
set PATH ~/bin /usr/local/bin/ $PATH
set -x -U GOPATH $HOME/go
set PATH $HOME/.local/bin $PATH
# set private environment variables stored outside source control
if test -r ~/.fish.env
    while read -l line
        string match -qr '^\s*(#|$)' -- $line; and continue
        set -l pair (string split -m 1 '=' -- $line)
        if test (count $pair) -eq 2
            set -gx $pair[1] $pair[2]
        end
    end < ~/.fish.env
end

# load my fish functions
for f in ~/.config/fish/ildarworld/*.fish
    test -f $f; and source $f
end

set -x PATH "/opt/homebrew/opt/python@3.13/libexec/bin" "$PATH"
set -x PATH "$HOME/poetry/bin" "$PATH"

set -g theme_color_scheme solarized
set -g theme_display_git_default_branch

set -g TERM xterm-256color

function setenv
    set -gx $argv
end

set fzf_diff_highlighter delta --paging=never --width=20
