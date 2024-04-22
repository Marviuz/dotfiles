return {
	"folke/zen-mode.nvim",
	opts = {},
	config = function(_, opts)
		local zen = require("zen-mode")
		local keymap = vim.keymap

		keymap.set("n", "<leader>zm", function()
			zen.toggle(opts)
		end, { desc = "Toggle zen mode" })
	end,
}
