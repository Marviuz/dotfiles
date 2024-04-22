return {
	"folke/twilight.nvim",
	opts = {},
	config = function(_, opts)
		local twilight = require("twilight")
		local keymap = vim.keymap

		twilight.setup(opts)

		keymap.set("n", "<leader>dim", "<cmd>Twilight<CR>", { desc = "Toggle twilight" })

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd("Twilight")
			end,
		})
	end,
}
