return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", version = "*" },
		"nvim-lua/plenary.nvim",
		{ "will-lynas/grapple-line.nvim", version = "1.x" },
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local grapple_line = require("grapple-line")

		grapple_line.setup({
			number_of_files = 10,
			colors = {
				active = "lualine_a_normal",
				inactive = "lualine_a_inactive",
			},
			mode = "unique_filename",
			show_names = false,
			overflow = "none",
			always_show_parent = {},
		})

		lualine.setup({
			options = {
				section_separators = { left = "", right = "" },
			},
			tabline = {
				lualine_a = {
					grapple_line.lualine,
				},
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
