hl.on("hyprland.start", function()
	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
end)

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
