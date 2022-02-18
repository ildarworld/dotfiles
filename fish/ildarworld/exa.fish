function l --wraps='exa -lahF' --description 'alias l=exa -laghF --icons'
    exa -lahF $argv --icons
end

function la --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    ls -lah $argv
end

function ls --description 'alias ls=exa'
    exa $argv
end
