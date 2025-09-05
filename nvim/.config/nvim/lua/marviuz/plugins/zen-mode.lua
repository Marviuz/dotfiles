return {
	"folke/zen-mode.nvim",
	config = function()
		local map = require("marviuz.utils.map")

		map("n", "<leader>zm", ":ZenMode<CR>", { desc = "Zen Mode" })
	end,
}
