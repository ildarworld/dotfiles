function pbcm
    set -l commit_hash (git rev-parse $argv)
    set -l commit_message (git log --format=%B -n 1 $commit_hash)
    echo -n $commit_message | pbcopy
    echo "Commit message copied to clipboard."
end
