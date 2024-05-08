return {
	-- "folke/tokyonight.nvim",
	-- priority = 1000,
	-- opts = {
	-- 	style = "night",
	-- 	transparent = true,
	-- 	on_highlights = function(hl, c)
	-- 		hl.TelescopeNormal.bg = "none"
	-- 		hl.TelescopeBorder.bg = "none"
	-- 		hl.TelescopePromptBorder.bg = "none"
	-- 	end,
	-- },
	-- config = function(_, opts)
	-- 	local tokyonight = require("tokyonight")
	-- 	tokyonight.setup(opts)
	-- 	vim.cmd("colorscheme tokyonight")
	-- end,

	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			transparent_background = true,
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,

	-- "EdenEast/nightfox.nvim",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd("colorscheme carbonfox")
	-- end,
}
