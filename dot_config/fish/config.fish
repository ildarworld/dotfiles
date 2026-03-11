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
fish_add_path "$HOME/bin" /usr/local/bin "$HOME/.local/bin"
set -gx GOPATH "$HOME/go"
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

if test -d "/opt/homebrew/opt/python@3.13/libexec/bin"
    fish_add_path "/opt/homebrew/opt/python@3.13/libexec/bin"
end

if test -d "$HOME/poetry/bin"
    fish_add_path "$HOME/poetry/bin"
end

set -g theme_color_scheme solarized
set -g theme_display_git_default_branch

set -g TERM xterm-256color

function setenv
    set -gx $argv
end

set fzf_diff_highlighter delta --paging=never --width=20
