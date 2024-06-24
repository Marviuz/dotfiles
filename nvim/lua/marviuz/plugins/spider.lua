return {
	"chrisgrieser/nvim-spider",
	lazy = false,
	config = function()
		local spider = require("spider")
		local map = require("marviuz.utils.map")

		spider.setup({
			skipInsignificantPunctuation = false,
		})

		map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
		map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
		map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
	end,
}
