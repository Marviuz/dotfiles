local consts = require("consts")
local keybind = require("utils").keybind

local keybinds = {
	{
		-- Open terminal
		key = keybind(consts.mainMod, "return"),
		dsp = hl.dsp.exec_cmd(consts.terminal),
	},
	{
		-- Close window
		key = keybind(consts.mainMod, "c"),
		dsp = hl.dsp.window.close(),
	},
	-- {
	-- 	-- Closes hyprland?
	-- 	key = keybind(consts.mainMod, "m"),
	-- 	dsp = hl.dsp.exec_cmd(
	-- 		"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
	-- 	),
	-- },
	{
		-- File manager
		key = keybind(consts.mainMod, "e"),
		dsp = hl.dsp.exec_cmd(consts.fileManager),
	},
	{
		-- Toggle floating
		key = keybind(consts.mainMod, "f"),
		dsp = hl.dsp.window.float({ action = "toggle" }),
	},
	{
		-- Open clipboard history
		key = keybind(consts.mainMod, "v"),
		dsp = hl.dsp.exec_cmd("cliphist list | rofi -dmenu -i | cliphist decode | wl-copy"),
	},
	{
		-- Open menu
		key = keybind(consts.mainMod, "space"),
		dsp = hl.dsp.exec_cmd(consts.menu),
	},
	{
		-- Open emoji picker
		key = keybind(consts.mainMod, "period"),
		dsp = hl.dsp.exec_cmd(consts.emoji),
	},
	{
		-- I don't know what this does
		key = keybind(consts.mainMod, "p"),
		dsp = hl.dsp.window.pseudo(),
	},

	-- Move focus
	{
		key = keybind(consts.mainMod, "h"),
		dsp = hl.dsp.window.move({ direction = "l" }),
	},
	{
		key = keybind(consts.mainMod, "j"),
		dsp = hl.dsp.window.move({ direction = "d" }),
	},
	{
		key = keybind(consts.mainMod, "k"),
		dsp = hl.dsp.window.move({ direction = "u" }),
	},
	{
		key = keybind(consts.mainMod, "l"),
		dsp = hl.dsp.window.move({ direction = "r" }),
	},

	-- Magic workspace (I don't really use these)
	-- {
	-- 	key = keybind(consts.mainMod, "S"),
	-- 	dsp = hl.dsp.workspace.toggle_special("magic"),
	-- },
	-- {
	-- 	key = keybind(consts.mainMod, "SHIFT", "S"),
	-- 	dsp = hl.dsp.window.move({ workspace = "special:magic" }),
	-- },

	-- Screenshots
	{
		key = keybind("print"),
		dsp = hl.dsp.exec_cmd("wayfreeze --hide-cursor & PID=$!; sleep .1; hyprshot -z -m output; kill $PID"),
	},
	{
		key = keybind("SHIFT", "print"),
		dsp = hl.dsp.exec_cmd("wayfreeze --hide-cursor & PID=$!; sleep .1; hyprshot -z -m window; kill $PID"),
	},
	{
		key = keybind(consts.mainMod, "SHIFT", "print"),
		dsp = hl.dsp.exec_cmd("wayfreeze --hide-cursor & PID=$!; sleep .1; hyprshot -z -m region; kill $PID"),
	},

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	{
		key = keybind(consts.mainMod, "mouse:272"),
		dsp = hl.dsp.window.drag(),
		opts = { mouse = true },
	},
	{
		key = keybind(consts.mainMod, "mouse:273"),
		dsp = hl.dsp.window.resize(),
		opts = { mouse = true },
	},

	-- Laptop multimedia keys for volume and LCD brightness
	{
		key = "XF86AudioRaiseVolume",
		dsp = hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86AudioLowerVolume",
		dsp = hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86AudioMute",
		dsp = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86AudioMicMute",
		dsp = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86MonBrightnessUp",
		dsp = hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86MonBrightnessDown",
		dsp = hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
		opts = { locked = true, repeating = true },
	},

	-- Requires playerctl
	{
		key = "XF86AudioNext",
		dsp = hl.dsp.exec_cmd("playerctl next"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86AudioPause",
		dsp = hl.dsp.exec_cmd("playerctl play-pause"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86AudioPlay",
		dsp = hl.dsp.exec_cmd("playerctl play-pause"),
		opts = { locked = true, repeating = true },
	},
	{
		key = "XF86AudioPrev",
		dsp = hl.dsp.exec_cmd("playerctl previous"),
		opts = { locked = true, repeating = true },
	},
}

for _, config in ipairs(keybinds) do
	local success, _ = pcall(function()
		hl.bind(config.key, config.dsp, config.opts or nil)
		return true
	end)

	if not success then
		hl.dsp.exec_cmd("notify-send 'keybinds.lua' '" .. config.key .. "'")
	end
end

-- Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 -> 0
	hl.bind(consts.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(keybind(consts.mainMod, "SHIFT", key), hl.dsp.window.move({ workspace = i }))
end

hl.bind(keybind("ALT", "TAB"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(keybind("ALT", "SHIFT", "TAB"), hl.dsp.focus({ workspace = "e-1" }))
