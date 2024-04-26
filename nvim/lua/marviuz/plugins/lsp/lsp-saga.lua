return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local lspsaga = require("lspsaga")
		local keymap = vim.keymap

		lspsaga.setup({})

		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Refactor variables like VSCode's F2" })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
