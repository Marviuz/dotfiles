local envs = {
	XCURSOR_SIZE = 24,
	HYPRCURSOR_SIZE = 24,
	LIBVA_DRIVER_NAME = "nvidia",
	__GLX_VENDOR_LIBRARY_NAME = "nvidia",
	ELECTRON_OZONE_PLATFORM_HINT = "auto",
  
  -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/#xdg-specifications
	XDG_CURRENT_DESKTOP = "Hyprland",
	XDG_SESSION_TYPE = "wayland",
	XDG_SESSION_DESKTOP = "Hyprland",
}

for k, v in pairs(envs) do
	hl.env(k, tostring(v))
end
