-- Floating toggle panes.
-- toggle_pane{} registers an action + keybind that shows/hides a persistent
-- floating block. Hiding detaches the block (it keeps running, nothing is
-- drawn); showing re-places it beside the focused pane and floats it.
-- One block per label per session.
--   name    action name (required)
--   label   block label, used to find the block (required)
--   key     hotkey; omit to register the action without a binding
--   title   action title shown in menus
--   bounds  { x, y, w, h } as fractions of the window (default 5% margin)
--   command argv to run instead of the shell, e.g. { "sqlit" }
--   cwd     starting directory
local ANIM_SECONDS = "0.35"

return function(opts)
	local label = opts.label
	local bounds = opts.bounds or { 0.05, 0.05, 0.9, 0.9 }

	rex.action({
		name = opts.name,
		title = opts.title or ("Toggle " .. label),
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

			-- Is the block placed somewhere? Detach it; stop if it was here.
			for _, w in ipairs(view.windows or {}) do
				for _, layer in ipairs(w.layers or {}) do
					for _, b in ipairs(layer.blocks or {}) do
						if b.label == label then
							-- Minimize first so its animation plays, then detach.
							if layer.kind == "floating" and w.window_id == active.window_id then
								rex.session.set_layer_state({ layer_id = layer.layer_id, state = "minimized" })
								rex.exec({ "sleep", ANIM_SECONDS })
							end
							check(rex.session.detach_block({ block_id = b.block_id }))
							if w.window_id == active.window_id then
								return
							end
						end
					end
				end
			end

			-- Find the detached block, or create it.
			local block_id
			local lb, e = rex.session.list_blocks({})
			check(lb, e)
			for _, b in ipairs(lb.blocks or {}) do
				if b.label == label then
					block_id = b.block_id
				end
			end
			if block_id == nil then
				local nb, e2 = rex.session.new_block({
					flavor = "com.superlogical.terminal.shell",
					label = label,
					options = { command = opts.command, cwd = opts.cwd },
				})
				check(nb, e2)
				block_id = nb.block_id
			end

			-- Place it beside the focused pane, then float it and focus it.
			check(rex.session.move_block({
				block_id = block_id,
				anchor_block_id = active.focused_block_id,
			}))
			local fl, fe = rex.session.float_block({
				block_id = block_id,
				bounds = bounds,
			})
			check(fl, fe)
			-- Minimize then restore so the restore animation plays.
			if fl.layer_id then
				rex.session.set_layer_state({ layer_id = fl.layer_id, state = "minimized" })
				rex.session.set_layer_state({ layer_id = fl.layer_id, state = "normal", focus = true })
			end
			check(rex.session.focus_block({ block_id = block_id }))
		end,
	})

	if opts.key then
		rex.bind(opts.key, opts.name)
	end
end
