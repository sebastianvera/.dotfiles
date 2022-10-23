function dotfile --description "edit dotfiles"
  switch $argv
    case alacritty
      e ~/dotfiles/alacritty/.config/alacritty/alacritty.yml
    case nvim
      e ~/dotfiles/nvim/.config/nvim/init.lua
    case fish
      e ~/dotfiles/fish/.config/fish/config.fish
    case git
      e ~/dotfiles/git/.gitconfig
    case tmux
      e ~/dotfiles/tmux/.tmux.conf
    case '*'
      echo 'Unknown dotfile. Add it to dotfile.fish file.'
      return 1
  end
end
