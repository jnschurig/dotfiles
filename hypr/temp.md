# Hyprland 0.55 Lua Migration

Below is a converted Lua-style configuration layout for your current Hyprland setup.

Directory structure:

```text
~/.config/hypr/
├── hyprland.lua
├── config/
│   ├── animations.lua
│   ├── autostart.lua
│   ├── decorations.lua
│   ├── defaults.lua
│   ├── environment.lua
│   ├── input.lua
│   ├── keybinds.lua
│   ├── monitor.lua
│   ├── variables.lua
│   └── windowrules.lua
```

---

## hyprland.lua

```lua
local hl = require("hyprland")

mainMod = "SUPER"

require("config.animations")
require("config.autostart")
require("config.decorations")
require("config.environment")
require("config.input")
require("config.keybinds")
require("config.monitor")
require("config.variables")
require("config.windowrules")
```

---

## config/defaults.lua

```lua
filemanager = "dolphin"
applauncher = "rofi -show run -modi window,run,combi -combi-modi window,run"
background_img = os.getenv("HOME") .. "/Pictures/wallpaper/lock_screen/crossing_in_japan.jpg"
terminal = "ghostty"
idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"
capturing = [[grim -g "$(slurp)" - | swappy -f -]]
set_colors = os.getenv("HOME") .. "/config_wrapper.sh"
```

---

## config/environment.lua

```lua
local hl = require("hyprland")

hl.env({ name = "HYPRCURSOR_SIZE", value = "24" })
hl.env({ name = "XCURSOR_SIZE", value = "24" })
hl.env({ name = "QT_CURSOR_SIZE", value = "24" })
hl.env({ name = "ECOSYSTEM", value = "no_update_news" })
```

---

## config/monitor.lua

```lua
local hl = require("hyprland")

hl.monitor({
    output = "eDP-2",
    mode = "2560x1600@165",
    position = "auto",
    scale = 1.25,
})

hl.monitor({
    output = "DP-5",
    mode = "2560x1440@144",
    position = "auto",
    scale = 1,
})

hl.monitor({
    output = "DP-8",
    mode = "2560x1440@144",
    position = "auto",
    scale = 1,
})

hl.monitor({
    output = "DP-9",
    mode = "2560x1440@144",
    position = "auto",
    scale = 1,
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})
```

---

## config/input.lua

```lua
local hl = require("hyprland")

hl.config({
    input = {
        follow_mouse = 2,
        float_switch_override_focus = 2,
    },
})
```

---

## config/decorations.lua

```lua
local hl = require("hyprland")

hl.config({
    decoration = {
        active_opacity = 1,
        rounding = 4,

        blur = {
            size = 15,
            passes = 2,
            xray = false,
            special = false,
            enabled = false,
        },

        shadow = {
            enabled = false,
        },
    },
})
```

---

## config/variables.lua

```lua
local hl = require("hyprland")

local colors = {
    cachylgreen = "rgba(9ccfd8ff)",
    cachymgreen = "rgba(70959cff)",
    cachydgreen = "rgba(486166ff)",
    cachylblue = "rgba(51c0edff)",
    cachymblue = "rgba(3e8fb0ff)",
    cachydblue = "rgba(254c8aff)",
    cachywhite = "rgba(ffffffff)",
    cachygrey = "rgba(ddddddff)",
    cachygray = "rgba(798bb2ff)",
}

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 3,
        ["col.active_border"] = colors.cachylgreen,
        ["col.inactive_border"] = colors.cachymblue,
        layout = "dwindle",

        snap = {
            enabled = true,
        },
    },

    gestures = {
        workspace_swipe_distance = 250,
        workspace_swipe_min_speed_to_force = 15,
        workspace_swipe_create_new = true,
    },

    group = {
        ["col.border_active"] = colors.cachydgreen,
        ["col.border_inactive"] = colors.cachylgreen,
        ["col.border_locked_active"] = colors.cachymgreen,
        ["col.border_locked_inactive"] = colors.cachydblue,

        groupbar = {
            font_family = "Fira Sans",
            text_color = colors.cachydblue,
            ["col.active"] = colors.cachydgreen,
            ["col.inactive"] = colors.cachylgreen,
            ["col.locked_active"] = colors.cachymgreen,
            ["col.locked_inactive"] = colors.cachydblue,
        },
    },

    misc = {
        font_family = "Fira Sans",
        splash_font_family = "Fira Sans",
        disable_hyprland_logo = true,
        col_splash = colors.cachylgreen,
        background_color = colors.cachydblue,
        enable_swallow = true,
        swallow_regex = "^(cachy-browser|firefox|nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate = true,
        vrr = 2,
    },

    render = {
        direct_scanout = true,
    },

    dwindle = {
        special_scale_factor = 0.95,
        pseudotile = true,
        preserve_split = true,
    },

    master = {
        new_status = "master",
        special_scale_factor = 0.8,
    },

    binds = {
        allow_workspace_cycles = 1,
        workspace_back_and_forth = 1,
        workspace_center_on = 1,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
    },
})
```

---

## config/animations.lua

```lua
local hl = require("hyprland")

hl.config({
    animations = {
        enabled = true,

        bezier = {
            {
                name = "overshot",
                points = "0.13, 0.99, 0.29, 1.1",
            },
        },

        animation = {
            "windowsIn, 1, 4, overshot, slide",
            "windowsOut, 1, 5, default, popin 80%",
            "border, 1, 5, default",
            "workspacesIn, 1, 6, overshot, slide",
            "workspacesOut, 1, 6, overshot, slidefade 80%",
            "specialWorkspaceIn, 1, 4, overshot, slidevert",
            "specialWorkspaceOut, 1, 4, overshot, slidefadevert 80%",
        },
    },
})
```

---

## config/autostart.lua

```lua
local hl = require("hyprland")
require("config.defaults")

local exec_once = {
    set_colors,
    "swaybg -o '*' -i " .. background_img .. " -m fill",
    "waybar",
    "fcitx5 -d",
    "mako",
    "nm-applet --indicator",
    [[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob -c ~/.config/hypr/wob.ini & disown"]],
    "/usr/lib/polkit-kde-authentication-agent-1",
    "blueman-applet",
    "systemctl --user import-environment",
    "dbus-update-activation-environment --systemd",
    "[workspace special silent; size 95% 5%; move 12.5% 10] " .. terminal,
}

for _, cmd in ipairs(exec_once) do
    hl.exec_once(cmd)
end
```

---

## config/windowrules.lua

```lua
local hl = require("hyprland")

local rules = {
    "float,class:^(org.pulseaudio.pavucontrol)$",
    "float,class:^()$ title:^(Picture in picture)$",
    "float,class:^(blueman-manager)$",
    "opacity 0.96,class:^(discord|armcord|webcord|legcord)$",
    "animation slide right,class:^(kitty|Alacritty|ghostty)$",
}

for _, rule in ipairs(rules) do
    hl.windowrule(rule)
end

hl.workspace_rule("w[tv1-10], gapsout:5, gapsin:3")
hl.workspace_rule("f[1], gapsout:5, gapsin:3")

hl.layerrule("animation slide down waybar")
hl.layerrule("animation slide top overlay")
hl.layerrule("animation fade 50% background")
```

---

## config/keybinds.lua

```lua
local hl = require("hyprland")
require("config.defaults")

local binds = {
    {
        mod = mainMod,
        key = "E",
        action = hl.action.exec,
        arg = filemanager,
        description = "Open file manager",
    },

    {
        mod = mainMod,
        key = "SPACE",
        action = hl.action.exec,
        arg = applauncher,
        description = "Open app launcher",
    },

    {
        mod = mainMod,
        key = "Q",
        action = hl.action.killactive,
        description = "Close active window",
    },

    {
        mod = mainMod,
        key = "F",
        action = hl.action.fullscreen,
        description = "Toggle fullscreen",
    },

    {
        mod = mainMod .. " SHIFT",
        key = "F",
        action = hl.action.togglefloating,
        description = "Toggle floating",
    },

    {
        mod = mainMod,
        key = "RETURN",
        action = hl.action.exec,
        arg = terminal,
        description = "Open terminal",
    },

    {
        mod = "",
        key = "XF86AudioRaiseVolume",
        action = hl.action.exec,
        arg = "pamixer -i 5",
    },

    {
        mod = "",
        key = "XF86AudioLowerVolume",
        action = hl.action.exec,
        arg = "pamixer -d 5",
    },
}

for _, bind in ipairs(binds) do
    hl.bind(bind)
end

for i = 1, 10 do
    local key = tostring(i % 10)

    hl.bind({
        mod = mainMod,
        key = key,
        action = hl.action.workspace,
        arg = tostring(i),
    })

    hl.bind({
        mod = mainMod .. " SHIFT",
        key = key,
        action = hl.action.movetoworkspace,
        arg = tostring(i),
    })
end
```

---

# Notes

A few items from your original config will likely need manual cleanup:

* `bindd`, `bindel`, and `bindl` semantics changed somewhat in Lua.
* Some `windowrule` syntax is deprecated and should become `windowrulev2`.
* Your `animation` rules may need slight adjustment depending on the exact 0.55 release.
* Touchpad/mouse modifier binds are especially likely to require tweaking.
* `envd` became standard environment declarations.

The above provides a strong migration baseline while preserving your current structure and behavior.
