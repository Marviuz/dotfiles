return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local lspsaga = require("lspsaga")
		local map = require("marviuz.utils.map")

		lspsaga.setup({})

		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Refactor variables like VSCode's F2" })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
