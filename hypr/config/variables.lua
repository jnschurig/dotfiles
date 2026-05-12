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
