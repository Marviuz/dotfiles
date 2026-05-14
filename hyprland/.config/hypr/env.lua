local envs = {
	XCURSOR_SIZE = 24,
	HYPRCURSOR_SIZE = 24,
	LIBVA_DRIVER_NAME = "nvidia",
	__GLX_VENDOR_LIBRARY_NAME = "nvidia",
	ELECTRON_OZONE_PLATFORM_HINT = "auto",
}

for k, v in pairs(envs) do
	hl.env(k, tostring(v))
end
