function e --description "execute $EDITOR"
  if count $argv > /dev/null
    $EDITOR $argv
  else
    $EDITOR +':Telescope find_files'
  end
end
