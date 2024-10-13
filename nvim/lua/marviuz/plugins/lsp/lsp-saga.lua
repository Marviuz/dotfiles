return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		-- "nvim-tree/nvim-web-devicons",
		{ "echasnovski/mini.icons", version = "*" },
	},
	config = function()
		local lspsaga = require("lspsaga")
		local map = require("marviuz.utils.map")

		lspsaga.setup({
			ui = {
				lightBulb = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
		})

		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Refactor variables like VSCode's F2" })
		map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code actions" })
		map("n", "<leader>k", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line diagnostics" })
	end,
}
