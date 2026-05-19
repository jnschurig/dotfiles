-- Settings
local notification_duration = 3000
local notifucation_font_size = 20

-- Toggle variable
local gamemode = false

function ToggleGameMode()
  if not gamemode then
    -- Performance improving configurations
    hl.config({
      animations = { enabled = false },

      decoration = {
        active_opacity = 1,
        inactive_opacity = 1,
        rounding = 0,

        blur = {
          xray = false,
          special = false,
          enabled = false,
        },

        shadow = { enabled = false, },
      },

      general = {
        gaps_in     = 0,
        gaps_out    = 0,
        border_size = 3,

        snap = { enabled = false, },
      },
    })

    gamemode = true

    hl.notification.create({
      text="🎮 Game Mode Enabled!",
      duration = notification_duration,
      font_size = notifucation_font_size,
      icon = "ok",
    })
  else
    hl.exec_cmd("hyprctl reload")
    gamemode = false

    hl.notification.create({
      text="🎮 Game Mode Disabled!",
      duration = notification_duration,
      font_size = notifucation_font_size,
      icon = "error",
    })
  end
end
