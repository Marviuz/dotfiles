return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "echasnovski/mini.icons", version = "*" },
		"albenisolmos/telescope-oil.nvim",
		{ "echasnovski/mini.pick", version = "*" },
		{ "folke/snacks.nvim", version = "*" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local Snacks = require("snacks")

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

		local snacks_opts = {
			win = {
				input = {
					keys = {
						["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
					},
				},
			},
			hidden = true,
			ignored = true,
			exclude = telescope_util.excludes,
			auto_close = true,
		}

		map("n", "<leader>ff", function()
			Snacks.picker.files(snacks_opts)
		end, { desc = "Open files using snacks" })

		map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

		map("n", "<leader>fs", function()
			Snacks.picker.grep(snacks_opts)
		end, { desc = "Grep using snacks" })

		-- map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

		-- map("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "View modified files" })
		map("n", "<leader>gs", function()
			Snacks.picker.git_status(snacks_opts)
		end, { desc = "Git status" })

		map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		map("n", "<space>fd", "<cmd>Telescope oil<CR>", { desc = "Find directory" })

		map("n", "<space>gb", function()
			Snacks.picker.git_branches()
		end, { desc = "Git branches" })

		-- LSP
		map("n", "gR", function()
			Snacks.picker.lsp_references(snacks_opts)
		end, { desc = "Show LSP references" })

		map("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { desc = "Go to definition" })
	end,
}
