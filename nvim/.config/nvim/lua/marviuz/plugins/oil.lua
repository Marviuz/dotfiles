return {
	"stevearc/oil.nvim",
	dependencies = {
		-- "nvim-tree/nvim-web-devicons",
		{ "echasnovski/mini.icons", version = "*" },
		"refractalize/oil-git-status.nvim",
	},
	opts = {
		lsp_file_methods = {
			timeout_ms = 10000,
		},
		view_options = {
			default_file_explorer = true,
			delete_to_trash = true,
			show_hidden = true,
			is_always_hidden = function(name, _)
				return name == ".."
			end,
		},
		win_options = {
			winbar = "%{v:lua.require('oil').get_current_dir()}",
			signcolumn = "yes:2",
		},
	},
	config = function(_, opts)
		local oil = require("oil")
		local oil_git_status = require("oil-git-status")

		local map = require("marviuz.utils.map")

		oil.setup(opts)
		oil_git_status.setup({ show_ignored = false })

		map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
