FileManager   = "nautilus"
Terminal      = "ghostty"
AppLauncher   = "rofi -show run -modi window,run,combi -combi-modi window,run"
BackgroundImg = os.getenv("HOME") .. "/Pictures/wallpaper/lock_screen/crossing_in_japan.jpg"
IdleHandler   = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"
CaptureFull   = 'grim - | tee ~/Desktop/"screenshot_$(date +%F-%H%M%S).png" | wl-copy && hyprctl notify 1 1500 0 "fontsize:15 Capture Saved"'
CaptureArea   = [[grim -g "$(slurp)" - | swappy -f -]]
