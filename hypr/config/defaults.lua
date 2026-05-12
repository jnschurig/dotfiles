Filemanager = "nautilus"
Applauncher = "rofi -show run -modi window,run,combi -combi-modi window,run"
Background_img = os.getenv("HOME") .. "/Pictures/wallpaper/lock_screen/crossing_in_japan.jpg"
Terminal = "ghostty"
Idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"
Capturing = [[grim -g "$(slurp)" - | swappy -f -]]
Set_colors = os.getenv("HOME") .. "/config_wrapper.sh"
