local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.enable_scroll_bar = true
config.default_prog = { "pwsh.exe" }
config.font = wezterm.font("GeistMono Nerd Font")
config.font_size = 10.0
config.default_cursor_style = "BlinkingBar"
config.background = {
	{
		source = {
			File = wezterm.home_dir .. "\\.config\\wezterm\\assets\\wallpaper.png",
		},
		horizontal_align = "Center",
		vertical_align = "Middle",
		opacity = 0.98,
		hsb = {
			brightness = 0.03,
		},
	},
}
config.color_scheme = "Windows 10 (base16)"
config.term = "xterm-256color"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},

	{
		key = "Y",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
}

return config
