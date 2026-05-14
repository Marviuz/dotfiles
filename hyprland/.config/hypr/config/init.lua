local theme = require("theme")
local animations = require("config.animations")

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 15,
		border_size = 1,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = theme.shadow,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	cursor = {
		no_hardware_cursors = false,
	},

	animations = animations,

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
		middle_click_paste = false,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},
})
