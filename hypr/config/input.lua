hl.config({
  input = {
    follow_mouse = 2,
    float_switch_override_focus = 2,
  },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
-- hl.gesture({ fingers = 3, direction = "down", action = "float" })
