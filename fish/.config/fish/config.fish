if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source

set -Ux EDITOR nvim

set -U fisher_path $__fish_config_dir/fisher_plugins
# FZF
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"

fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin

# Added by `rbenv init` on Sun Feb  2 20:50:47 PST 2025
status --is-interactive; and rbenv init - --no-rehash fish | source
