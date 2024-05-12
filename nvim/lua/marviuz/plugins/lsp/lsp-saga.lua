return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local lspsaga = require("lspsaga")
		local map = require("marviuz.utils.map")

		lspsaga.setup({
			symbol_in_winbar = {
				enable = false,
			},
		})

		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Refactor variables like VSCode's F2" })
		map("n", "<leader>ca", "<cmd>Lspsaga code_action", { desc = "Code actions" })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
