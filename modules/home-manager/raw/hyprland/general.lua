-- MONITOR CONFIG
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1,
})

hl.gesture({
	fingers = 3,
	direction = "swipe",
	action = "move",
})
hl.gesture({
	fingers = 3,
	direction = "pinch",
	action = "fullscreen",
})
hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})

hl.env =
	{
		"XCURSOR_SIZE,24",
		"XCURSOR_THEME,WhiteSur",
	}, hl.config({
		gestures = {
			workspace_swipe_distance = 700,
			workspace_swipe_cancel_ratio = 0.2,
			workspace_swipe_min_speed_to_force = 5,
			workspace_swipe_direction_lock = true,
			workspace_swipe_direction_lock_threshold = 10,
			workspace_swipe_create_new = true,
		},
		general = {
			-- Gaps and border
			gaps_in = 4,
			gaps_out = 5,
			gaps_workspaces = 50,

			border_size = 2,

			col = {
				active_border = "rgba(0DB7D455)",
				inactive_border = "rgba(31313600)",
			},
			resize_on_border = true,

			no_focus_fallback = true,
			allow_tearing = true, -- This just allows the `immediate` window rule to work
			snap = {
				enabled = true,
				window_gap = 4,
				monitor_gap = 5,
				respect_gaps = true,
			},
		},
		decoration = {
			-- 2 = circle, higher = squircle, 4 = very obvious squircle
			-- Fuck clearly visible squircles. 100% Apple brainrot.
			rounding_power = 2.5,
			rounding = 18,

			blur = {
				enabled = true,
				xray = true,
				special = false,
				new_optimizations = true,
				size = 10,
				passes = 3,
				brightness = 1,
				noise = 0.05,
				contrast = 0.89,
				vibrancy = 0.5,
				vibrancy_darkness = 0.5,
				popups = false,
				popups_ignorealpha = 0.6,
				input_methods = true,
				input_methods_ignorealpha = 0.8,
			},
			shadow = {
				enabled = true,
				range = 20,
				offset = { 0, 2 },
				render_power = 10,
				color = "rgba(00000020)",
			},
			-- Dim
			dim_inactive = true,
			dim_strength = 0.05,
			dim_special = 0.2,
		},
	})
