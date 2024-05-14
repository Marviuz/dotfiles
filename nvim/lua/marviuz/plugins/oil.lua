return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		local oil = require("oil")
		local map = require("marviuz.utils.map")

		oil.setup(opts)

		map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
