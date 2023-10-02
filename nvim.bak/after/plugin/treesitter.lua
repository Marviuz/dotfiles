local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	hightlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"lua",
		"json",
		"css",
		"astro",
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
})
