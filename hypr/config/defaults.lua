FileManager = "nautilus"
AppLauncher = "rofi -show run -modi window,run,combi -combi-modi window,run"
BackgroundImg = os.getenv("HOME") .. "/Pictures/wallpaper/lock_screen/crossing_in_japan.jpg"
Terminal = "ghostty"
IdleHandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"
Capturing = [[grim -g "$(slurp)" - | swappy -f -]]
