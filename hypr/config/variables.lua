local colors = {
  lgreen = "rgba(9ccfd8ff)",
  mgreen = "rgba(70959cff)",
  dgreen = "rgba(486166ff)",
  -- lblue = "rgba(51c0edff)",
  mblue = "rgba(3e8fb0ff)",
  dblue = "rgba(254c8aff)",
  -- white = "rgba(ffffffff)",
  -- grey = "rgba(ddddddff)",
  -- gray = "rgba(798bb2ff)",
}

hl.config({
  general = {
    gaps_in     = 3,
    gaps_out    = 5,
    border_size = 3,
    ["col.active_border"  ] = colors.lgreen,
    ["col.inactive_border"] = colors.mblue,
    layout = "dwindle",

    snap = {
      enabled = true,
    },
  },

  gestures = {
    workspace_swipe_distance           = 250,
    workspace_swipe_min_speed_to_force = 15,
    workspace_swipe_create_new         = true,
  },

  group = {
    ["col.border_active"         ] = colors.dgreen,
    ["col.border_inactive"       ] = colors.lgreen,
    ["col.border_locked_active"  ] = colors.mgreen,
    ["col.border_locked_inactive"] = colors.dblue,

    groupbar = {
      font_family = "Fira Sans",
      text_color  = colors.dblue,
      ["col.active"         ] = colors.dgreen,
      ["col.inactive"       ] = colors.lgreen,
      ["col.locked_active"  ] = colors.mgreen,
      ["col.locked_inactive"] = colors.dblue,
    },
  },

  misc = {
    font_family           = "Fira Sans",
    splash_font_family    = "Fira Sans",
    disable_hyprland_logo = true,
    background_color      = colors.dblue,
    enable_swallow        = true,
    swallow_regex         = "^(cachy-browser|firefox|nautilus|nemo|thunar|btrfs-assistant.)$",
    focus_on_activate     = true,
    vrr                   = 2,
  },

  render = {
    direct_scanout = true,
  },

  dwindle = {
    special_scale_factor = 0.95,
    preserve_split       = true,
  },

  master = {
    new_status           = "master",
    special_scale_factor = 0.8,
  },

  binds = {
    allow_workspace_cycles            = 1,
    workspace_back_and_forth          = 1,
    workspace_center_on               = 1,
    movefocus_cycles_fullscreen       = true,
    window_direction_monitor_fallback = true,
  },
})
