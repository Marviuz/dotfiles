local wezterm = require("wezterm")
local act = wezterm.action

local CODING_ZONE = 1024
-- local DEFAULT_BACKGROUND = {
-- 	{
-- 		source = {
-- 			File = wezterm.home_dir .. "\\.config\\wezterm\\assets\\wallpaper.png",
-- 		},
-- 		horizontal_align = "Center",
-- 		vertical_align = "Middle",
-- 		opacity = 0.98,
-- 		hsb = {
-- 			brightness = 0.3,
-- 			-- brightness = 0.03,
-- 		},
-- 	},
-- }
local DEFAULT_PADDING = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

local config = wezterm.config_builder()

config.enable_wayland = false

config.enable_scroll_bar = true
-- config.default_prog = { "pwsh.exe" }
config.font = wezterm.font("GeistMono Nerd Font")
config.font_size = 10.0
config.default_cursor_style = "BlinkingBar"
-- config.background = DEFAULT_BACKGROUND
config.color_scheme = "Windows 10 (base16)"
config.term = "xterm-256color"
config.window_padding = DEFAULT_PADDING

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
	{
		key = "F",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window)
			local screen = window:get_dimensions().pixel_width
			local padding_width = math.floor((screen - CODING_ZONE) / 2)

			local overrides = window:get_config_overrides() or {}

			local padding = overrides.window_padding or DEFAULT_PADDING

			if padding.left ~= 0 or padding.right ~= 0 then
				overrides.window_padding = DEFAULT_PADDING
			else
				overrides.window_padding = {
					left = padding_width,
					right = padding_width,
					top = DEFAULT_PADDING.top,
					bottom = DEFAULT_PADDING.botton,
				}
			end

			window:set_config_overrides(overrides)
		end),
	},
	-- {
	-- 	key = "B",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action_callback(function(window)
	-- 		local overrides = window:get_config_overrides() or {}
	--
	-- 		if not overrides.background or #overrides.background ~= #DEFAULT_BACKGROUND then
	-- 			overrides.background = DEFAULT_BACKGROUND
	-- 		else
	-- 			overrides.background = {} -- Clear background
	-- 		end
	--
	-- 		window:set_config_overrides(overrides)
	-- 	end),
	-- },
}

return config
