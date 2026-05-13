local startup = {
  SetColors,
  "swaybg -o '*' -i " .. BackgroundImg .. " -m fill",
  "waybar",
  "fcitx5 -d",
  "mako",
  "nm-applet --indicator",
  [[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob -c ~/.config/hypr/wob.ini & disown"]],
  "/usr/lib/polkit-kde-authentication-agent-1",
  "blueman-applet",
  "systemctl --user import-environment",
  "dbus-update-activation-environment --systemd",
  "[workspace special silent; size 95% 5%; move 12.5% 10] " .. Terminal,
}

hl.on("hyprland.start", function()
  for _, cmd in ipairs(startup) do
    hl.exec_cmd(cmd)
  end
end)
