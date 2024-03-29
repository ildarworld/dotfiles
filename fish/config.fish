#eval (python -m virtualfish)

# disable fish greeting
set fish_greeting

# like `set -o vi` in bash
fish_vi_key_bindings

# enable Ctrl-F in vi mode
# https://github.com/fish-shell/fish-shell/issues/3541#issuecomment-260001906
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

# disable ugly vi mode prompt
function fish_mode_prompt
end

set -x LC_ALL en_US.UTF-8
set -x VIRTUAL_ENV_DISABLE_PROMPT off
set PATH ~/bin /usr/local/bin/ $PATH
set -x -U GOPATH $HOME/go

# set private environment variables stored outsited source control
test -r ~/.fish.env; and export (cat ~/.fish.env|xargs -L 1)
for f in (find ~/.config/fish/ybot/ -type f  -name '*.fish')
    source $f
end

# load my fish functions
for f in (find ~/.config/fish/ildarworld/ -type f  -name '*.fish')
    source $f
end
# Setting PATH for Python 3.9

# The original version is saved in /Users/ildar/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"
set -g theme_color_scheme solarized
set -g theme_display_git_default_branch

# Setting PATH for Python 3.10
# The original version is saved in /Users/ildar/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

set -x PATH "/Users/ildar/Library/Python/3.10/bin" "$PATH"



if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end


function setenv
    set -gx $argv
end

direnv hook fish | source

# Setting PATH for Python 3.11
# The original version is saved in /Users/ildar/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/ildar/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.fish ]; and . /Users/ildar/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.fish
starship init fish | source
