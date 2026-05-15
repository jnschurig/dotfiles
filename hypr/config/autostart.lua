local startup = {
  "swaybg -o '*' -i " .. BackgroundImg .. " -m fill", -- Background
  "waybar",
  -- "fcitx5 -d", -- Manage multi-language text input
  "mako", -- Notifications
  "nm-applet --indicator", -- Network
  [[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob -c ~/.config/hypr/wob.ini & disown"]],
  -- "/usr/lib/polkit-kde-authentication-agent-1", -- Authentication helper
  "/usr/lib/hyprpolkitagent", -- Authentication helper
  "blueman-applet",
  "systemctl --user import-environment",
  "dbus-update-activation-environment --systemd",
}

hl.on("hyprland.start", function()
  for _, cmd in ipairs(startup) do
    hl.exec_cmd(cmd)
  end
end)
