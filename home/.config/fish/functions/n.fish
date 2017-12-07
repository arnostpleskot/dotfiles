function n
  if count $argv > 0
    nvim $argv
  else
    nvim .
  end
end
