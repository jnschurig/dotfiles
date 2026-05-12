filemanager = "nautilus"
applauncher = "rofi -show run -modi window,run,combi -combi-modi window,run"
background_img = os.getenv("HOME") .. "/Pictures/wallpaper/lock_screen/crossing_in_japan.jpg"
terminal = "ghostty"
idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"
capturing = [[grim -g "$(slurp)" - | swappy -f -]]
set_colors = os.getenv("HOME") .. "/config_wrapper.sh"
