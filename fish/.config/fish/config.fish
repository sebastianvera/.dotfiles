if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux EDITOR nvim

set -U fisher_path $__fish_config_dir/fisher_plugins

fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin
