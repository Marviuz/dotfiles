return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-project.nvim",
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
				layout_config = {
					prompt_position = "top",
				},
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
			extensions = {
				file_browser = {
					theme = "ivy",
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("project")
		telescope.load_extension("file_browser")

		map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		map("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "View modified files" })

		map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		map("n", "<leader>ub", telescope_util.unsaved_buffers, { desc = "View unsaved buffers" })
		map("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>", { desc = "Browse projects" })

		map(
			"n",
			"<space>fb",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "open file_browser with the path of the current buffer" }
		)
	end,
}
