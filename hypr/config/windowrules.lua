local sidebar_classes = {
  { name = "blueman-manager", ratio = 0.25, min_width = 528, max_width = 550 },
  { name = "org.pulseaudio.pavucontrol", ratio = 0.35, min_width = 716, max_width = 800 },
}

-- Dynamic Sidebar Panes
for _, sidebar in ipairs(sidebar_classes) do
  hl.window_rule({
    match = { class = "^(" .. sidebar.name .. ")$" },
    float = true,
    pin = true,
    animation = "slide right",
    min_size = { sidebar.min_width, "(monitor_h-50)" },
    max_size = { sidebar.max_width, "(monitor_h-50)" }, -- Not enforced for some reason...
    size = { "monitor_w*" .. sidebar.ratio, "(monitor_h-50)" },
    move = { "monitor_w-window_w-10", 45 },
    opacity = "0.95 override 0.6 override",
    tag = "+sidebar",
  })
end

local dropdown_classes = {
  { name = "org.strawberrymusicplayer.strawberry", ratio = 0.25, min_height = 300, max_height = 1000 },
}

-- Dynamic Dropdown Panes
for _, dropdown in ipairs(dropdown_classes) do
  hl.window_rule({
    match = { class = "^(" .. dropdown.name .. ")$" },
    float = true,
    min_size = { "monitor_w*0.95", dropdown.min_height },
    max_size = { "monitor_w*0.95", dropdown.max_height },
    size = { "monitor_w*0.95", "monitor_h*".. dropdown.ratio },
    move = { "(monitor_w-window_w)/2", 45 },
    opacity = "0.85 override 0.6 override",
    tag = "+dropdown",
    workspace = "special:music",
  })
end

hl.window_rule({
  match = { class = "^()$", title = "^(Picture in picture)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(gsimplecal)$" },
  float = true,
  pin = true,
  move = { "monitor_w-(monitor_w*0.5)-(window_w*0.5)", 45 },
})

hl.window_rule({
  match = { class = "^(discord|armcord|webcord|legcord)$" },
  opacity = 0.96,
})

hl.window_rule({
  match = { class = "com.mitchellh.ghostty" },
  opacity = "0.9 override",
})
