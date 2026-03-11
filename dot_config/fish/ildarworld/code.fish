# alias to launch vscode
function code
    if command -q code
        command code $argv
    else if test -x /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $argv
    else
        echo "code command not found in PATH." >&2
        return 127
    end
end
