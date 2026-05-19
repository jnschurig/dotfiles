hl.config({
  binds = {
    allow_workspace_cycles            = 1,
    workspace_back_and_forth          = 1,
    workspace_center_on               = 1,
    movefocus_cycles_fullscreen       = true,
    window_direction_monitor_fallback = true,
    -- drag_threshold = 10,
  },
  input = {
    kb_options = "ctrl:nocaps", -- set capslock = ctrl
    follow_mouse = 2,
    float_switch_override_focus = 2,
    touchpad = {
      disable_while_typing = true,
    },
  },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
-- hl.gesture({ fingers = 3, direction = "down", action = "float" })
