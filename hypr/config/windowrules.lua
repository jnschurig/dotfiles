local sidebar_classes = {
  { name = "blueman-manager"           , ratio = 0.25, min_width = 528, max_width = 550 },
  { name = "org.pulseaudio.pavucontrol", ratio = 0.35, min_width = 716, max_width = 800 },
}

hl.window_rule({
  match = { class = "^()$", title = "^(Picture in picture)$" },
  float = true,
})

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
    tag = "sidebar"
  })
end

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

hl.workspace_rule({ workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3 })
hl.workspace_rule({ workspace = "f[1]"     , gaps_out = 5, gaps_in = 3 })

hl.layer_rule({ match = { namespace = "waybar"     }, animation = "slide down" })
hl.layer_rule({ match = { namespace = "overlay"    }, animation = "slide top"  })
hl.layer_rule({ match = { namespace = "background" }, animation = "fade 50%"   })
