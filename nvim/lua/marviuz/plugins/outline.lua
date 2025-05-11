return {
	"hedyhli/outline.nvim",
	config = function()
		local outline = require("outline")
		local map = require("marviuz.utils.map")

		outline.setup()

		map("n", "<leader>ol", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
	end,
}
