function l --wraps='eza -lahF' --description 'alias l=eza -laghF --icons=always --git --no-time --no-permissions --long'
    eza -lahF $argv --icons=always --no-user --no-permissions
end

function la --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    ls -lah $argv
end

function ls --description 'alias ls=eza'
    eza $argv --icons=always --no-user --no-permissions --git --long
end

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
