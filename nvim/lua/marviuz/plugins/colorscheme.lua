return {
	"folke/tokyonight.nvim",
	priority = 1000,
	opts = {
		style = "night",
	},
	config = function(_, opts)
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
	-- "EdenEast/nightfox.nvim",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd("colorscheme carbonfox")
	-- end,
}
