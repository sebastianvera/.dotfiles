complete --command dotfile -x -a "(exa -d ~/dotfiles/*/ -1 | awk -F '/' '{print \$NF}')"

