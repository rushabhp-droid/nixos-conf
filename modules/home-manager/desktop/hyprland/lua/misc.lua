hl.config({
	misc = {
		force_default_wallpaper = -1,  -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
		vrr                     = 1,
		enable_swallow          = true,
		swallow_regex           = "^(kitty|Alacritty)$",
	},
})

-- Layout
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
	master = {
		new_status = "master",
	},
	scrolling = {
		fullscreen_on_one_column = true,
	},
})
