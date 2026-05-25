-- Default colors
local colors = {
  black   = "rgba(000000ff)",
  red     = "rgba(ff0000ff)",
  green   = "rgba(486166ff)",
  yellow  = "rgba(70959cff)",
  blue    = "rgba(254c8aff)",
  magenta = "rgba(3e8fb0ff)",
  cyan    = "rgba(3e8fb0ff)",
  white   = "rgba(ffffffdd)",

  bright_black   = "rgba(ffffff88)",
  bright_red     = "rgba(ff0000ff)",
  bright_green   = "rgba(9ccfd8ff)",
  bright_yellow  = "rgba(70959cff)",
  bright_blue    = "rgba(51c0edff)",
  bright_magenta = "rgba(3e8fb0ff)",
  bright_cyan    = "rgba(3e8fb0ff)",
  bright_white   = "rgba(ffffffff)",

  background           = "rgba(282a36ff)",
  foreground           = "rgba(f8f8f2ff)",
  selection_background = "rgba(44475aff)",
  selection_foreground = "rgba(ffffffff)",
  cursor               = "rgba(f8f8f2ff)",
  cursor_text          = "rgba(282a36ff)",
}

-- Dynamic colors
local color_table = nil
local handle = io.popen(TermColors .. " --source ghostty --include-aliases", "r")
if handle then
  local result = handle:read("*a")
  handle:close()

  local json = require("..lib.dkjson")
  color_table = json.decode(result)
end

local do_notify_theme = false

if color_table and color_table.palette then
  if do_notify_theme then
    hl.notification.create({
      text = "Theme: " .. color_table.meta.theme,
      duration = 1600,
      font_size = 15,
      icon = "info",
    })
  end

  colors = {
    black          = color_table.palette[1],
    red            = color_table.palette[2],
    green          = color_table.palette[3],
    yellow         = color_table.palette[4],
    blue           = color_table.palette[5],
    magenta        = color_table.palette[6],
    cyan           = color_table.palette[7],
    white          = color_table.palette[8],

    bright_black   = color_table.palette[9],
    bright_red     = color_table.palette[10],
    bright_green   = color_table.palette[11],
    bright_yellow  = color_table.palette[12],
    bright_blue    = color_table.palette[13],
    bright_magenta = color_table.palette[14],
    bright_cyan    = color_table.palette[15],
    bright_white   = color_table.palette[16],

    background           = color_table.special.background,
    foreground           = color_table.special.foreground,
    selection_background = color_table.special.selection_background,
    selection_foreground = color_table.special.selection_foreground,
    cursor               = color_table.special.cursor,
    cursor_text          = color_table.special.cursor_text,
  }
end

local border_active    = colors.blue
local border_inactive  = colors.bright_black
local border_other     = colors.green
local text_color       = colors.foreground
local background_color = colors.background
local splash_color     = colors.selection_background

-- hl.notification.create({
--   text = "border_active=" .. border_active
--   .."\ncolors.blue=" .. colors.blue,
--   duration = 10000,
--   icon="info",
-- })

hl.config({
  general = {
    layout      = "dwindle",
    gaps_in     = 3,
    gaps_out    = 5,
    border_size = 3,
    ["col.active_border"]         = border_active,
    ["col.inactive_border"]       = border_inactive,
    ["col.nogroup_border"]        = border_other,
    ["col.nogroup_border_active"] = border_other,

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
    ["col.border_active"]          = border_active,
    ["col.border_inactive"]        = border_inactive,
    ["col.border_locked_active"]   = border_other,
    ["col.border_locked_inactive"] = border_other,

    groupbar = {
      font_family             = "Fira Sans",
      text_color              = text_color,
      ["col.active"]          = border_active,
      ["col.inactive"]        = border_inactive,
      ["col.locked_active"]   = border_other,
      ["col.locked_inactive"] = border_other,
    },
  },

  misc = {
    font_family           = "Fira Sans",
    splash_font_family    = "Fira Sans",
    disable_hyprland_logo = true,
    background_color      = background_color,
    ["col.splash"]        = splash_color,
    enable_swallow        = true,
    swallow_regex         = "^(cachy-browser|firefox|nautilus|nemo|thunar|btrfs-assistant.)$",
    focus_on_activate     = true,
    vrr = 2,
  },

  render = {
    direct_scanout = true,
  },

  dwindle = {
    special_scale_factor = 0.96,
    preserve_split = true,
  },

  master = {
    new_status = "master",
    special_scale_factor = 0.8,
  },
})
