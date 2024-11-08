return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		local no_neck_pain = require("no-neck-pain")
		local map = require("marviuz.utils.map")

		no_neck_pain.setup()

		map("n", "<leader>zm", ":NoNeckPain<CR>", { desc = "Zen mode" })
	end,
}
