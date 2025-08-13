return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "echasnovski/mini.icons", version = "*" },
		"albenisolmos/telescope-oil.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local map = require("marviuz.utils.map")
		local telescope_util = require("marviuz.utils.telescope")

		telescope.setup({
			pickers = {
				find_files = telescope_util.select_find_command(),
			},
			defaults = {
				sorting_strategy = "ascending",
				path_display = { "smart" },
				mappings = {
					n = {
						["q"] = actions.close,
					},
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("oil")

		map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

		map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		map("n", "<space>fd", "<cmd>Telescope oil<CR>", { desc = "Find directory" })
	end,
}
