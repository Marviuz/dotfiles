return {
	"dlyongemallo/diffview.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		local diffview = require("diffview")

		diffview.setup({
			enhanced_diff_hl = true,
			merge_tool = {
				layout = "diff3_mixed",
			},
		})

		vim.api.nvim_create_user_command("Dfo", function()
			vim.cmd("DiffviewOpen")
		end, { desc = "Open Diff View" })

		vim.api.nvim_create_user_command("Dfx", function()
			vim.cmd("DiffviewClose")
		end, { desc = "Close Diff View" })
	end,
}
