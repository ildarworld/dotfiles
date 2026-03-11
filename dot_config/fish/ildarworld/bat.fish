function cat --description 'alias cat=bat'
    if isatty stdout; and command -q bat
        command bat $argv
    else
        command cat $argv
    end
end
