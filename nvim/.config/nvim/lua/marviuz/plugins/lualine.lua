return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", version = "*" },
		"nvim-lua/plenary.nvim",
		"marviuz/grapple-line.nvim",
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
			show_names = true,
			overflow = "none",
			always_show_parent = {},

			formatter = function(index, name, _)
				return string.format("%d: %s", index, name)
			end,
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
