hl.workspace_rule({ workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 5, gaps_in = 3 })

hl.layer_rule({ match = { namespace = "waybar" }, animation = "slide down" })
hl.layer_rule({ match = { namespace = "overlay" }, animation = "slide top" })
hl.layer_rule({ match = { namespace = "background" }, animation = "fade 50%" })
-- hl.layer_rule({ match = { class = "background" }, animation = "fade 50%"   })

-- Start ghostty in the special workspace when the workspace is created empty
hl.workspace_rule({
  workspace = "special:terminal",
  on_created_empty = "ghostty",
})

-- Start strawberry in the music workspace when the workspace is created empty
hl.workspace_rule({
  workspace = "special:music",
  on_created_empty = "strawberry",
  border_size = 0,
  gaps_in = 0,
  gaps_out = 0,
})

-- Make solo windows not have borers, gaps, and rounding
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })

-- Not sure what these are, but they are the same as above, but for "f" worksapces.
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
