hl.on("hyprland.start", function()
	-- exec-once how?
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaync")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("fusuma")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

  -- Might be a bug
  -- systemctl --user enable /usr/lib/xdg-desktop-portal
	hl.exec_cmd("/usr/lib/xdg-desktop-portal")
end)
