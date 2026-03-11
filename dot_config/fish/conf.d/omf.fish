# Path to Oh My Fish install.
if set -q XDG_DATA_HOME
    set omf_xdg_path "$XDG_DATA_HOME/omf"
else
    set omf_xdg_path "$HOME/.local/share/omf"
end
set omf_legacy_path "$HOME/.local/omf"

if test -f "$omf_xdg_path/init.fish"
    set -gx OMF_PATH "$omf_xdg_path"
else if test -f "$omf_legacy_path/init.fish"
    set -gx OMF_PATH "$omf_legacy_path"
end

# Load Oh My Fish configuration if installed.
if set -q OMF_PATH; and test -f "$OMF_PATH/init.fish"
    source "$OMF_PATH/init.fish"
end
