return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		-- Mini icons currently not supported
		-- { "echasnovski/mini.icons", version = "*", config = true },
	},
	config = function()
		local diffview = require("diffview")
    local map = require('marviuz.utils.map')

		diffview.setup({
			merge_tool = {
				layout = "diff3_mixed",
			},
		})

		map("n", "<leader>dfo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
		map("n", "<leader>dfx", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
	end,
}
