-- Start ghostty in the special workspace when the workspace is created empty
hl.workspace_rule({
  workspace = "special:terminal",
  on_created_empty = "ghostty",
})

-- Start strawberry in the music workspace when the workspace is created empty
hl.workspace_rule({
  workspace = "special:music",
  on_created_empty = "strawberry",
})
