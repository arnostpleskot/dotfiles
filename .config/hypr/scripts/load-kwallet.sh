 #!/usr/bin/env bash

 # https://www.reddit.com/r/hyprland/comments/18vj7b5/comment/kg7mg3s/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button

sleep 25 && /usr/lib/pam_kwallet_init --no-startup-id

notify-send 'Kwallet has been loaded. Loading dependant apps...' 
