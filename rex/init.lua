rex.bind("alt+j", "client.prompt.next")
rex.bind("alt+k", "client.prompt.previous")
rex.bind("alt+down", "client.prompt.next")
rex.bind("alt+up", "client.prompt.previous")
rex.bind("alt+tab", "pane.focus_next")
rex.bind("alt+shift+tab", "pane.focus_previous")
rex.bind("ctrl+shift+j", "pane.split", { direction = "down" })
rex.bind("ctrl+shift+l", "pane.split", { direction = "right" })
rex.bind("ctrl+shift+down", "pane.split", { direction = "down" })
rex.bind("ctrl+shift+right", "pane.split", { direction = "right" })
rex.bind("ctrl+shift+r", "pane.balance")

-- Super+Esc: toggle a persistent floating scratch shell.
-- Hiding detaches the block (it keeps running, nothing is drawn); showing
-- re-places it beside the focused pane and floats it. One shell per session.
rex.action({
	name = "scratch_toggle",
	title = "Toggle Scratch Pane",
	run = function(ctx, args)
		local function check(_, e)
			if e ~= nil then
				error(e, 0)
			end
		end

		local view, err = rex.session.view({})
		if err ~= nil then
			error(err, 0)
		end
		local active
		for _, w in ipairs(view.windows or {}) do
			if w.window_id == view.active_window_id then
				active = w
			end
		end
		if active == nil then
			return
		end

		-- Is the scratch block placed somewhere? Detach it; stop if it was here.
		for _, w in ipairs(view.windows or {}) do
			for _, layer in ipairs(w.layers or {}) do
				for _, b in ipairs(layer.blocks or {}) do
					if b.label == "scratch" then
						check(rex.session.detach_block({ block_id = b.block_id }))
						if w.window_id == active.window_id then
							return
						end
					end
				end
			end
		end

		-- Find the detached scratch block, or create it.
		local scratch_id
		local lb, e = rex.session.list_blocks({})
		check(lb, e)
		for _, b in ipairs(lb.blocks or {}) do
			if b.label == "scratch" then
				scratch_id = b.block_id
			end
		end
		if scratch_id == nil then
			local nb, e2 = rex.session.new_block({
				flavor = "com.superlogical.terminal.shell",
				label = "scratch",
			})
			check(nb, e2)
			scratch_id = nb.block_id
		end

		-- Place it beside the focused pane, then float it and focus it.
		check(rex.session.move_block({
			block_id = scratch_id,
			anchor_block_id = active.focused_block_id,
		}))
		check(rex.session.float_block({
			block_id = scratch_id,
			bounds = { 0.05, 0.05, 0.9, 0.9 },
		}))
		check(rex.session.focus_block({ block_id = scratch_id }))
	end,
})

rex.bind("super+escape", "scratch_toggle")
