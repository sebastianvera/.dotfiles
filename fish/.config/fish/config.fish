if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux EDITOR nvim

set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -U fisher_path $__fish_config_dir/fisher_plugins
