return {
	"dlyongemallo/diffview.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		local diffview = require("diffview")
		local map = require("marviuz.utils.map")

		diffview.setup({
			merge_tool = {
				layout = "diff3_mixed",
			},
		})

		map("n", "<leader>dfo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
		map("n", "<leader>dfx", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
	end,
}
