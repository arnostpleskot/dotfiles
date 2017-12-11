function n
  if count $argv
    nvim $argv
  else
    nvim .
  end
end
