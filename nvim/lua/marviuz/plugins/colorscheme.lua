return {
	"folke/tokyonight.nvim",
	priority = 1000,
	opts = {
		style = "night",
		transparent = true,
	},
	config = function(_, opts)
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		vim.cmd("colorscheme tokyonight")
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	end,
	-- "EdenEast/nightfox.nvim",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd("colorscheme carbonfox")
	-- end,
}
