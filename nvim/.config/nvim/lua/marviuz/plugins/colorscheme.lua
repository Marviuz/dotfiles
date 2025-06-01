local transparent_enabled = vim.g.transparent_enabled

local colorschemes = {
	{
		name = "Poimandres",
		colorscheme = "poimandres",
		before = function()
			local poimandres = require("poimandres")
			poimandres.setup({
				disable_background = transparent_enabled,
			})
		end,
	},
	{
		name = "VSCode Modern",
		colorscheme = "vscode_modern",
		before = function()
			local vscode_modern = require("vscode_modern")

			vscode_modern.setup({
				transparent_background = transparent_enabled,
			})
		end,
	},
}

table.sort(colorschemes, function(a, b)
	return a.name < b.name
end)

return {
	"panghu-huang/theme-picker.nvim",
	dependencies = {
		"xiyaowong/transparent.nvim",
		"olivercederborg/poimandres.nvim",
		"gmr458/vscode_modern_theme.nvim",
	},
	lazy = false,
	priority = 1000,
	opts = {
		picker = {
			layout_config = {
				width = 0.35,
				height = 0.5,
			},
		},
		themes = colorschemes,
	},
	config = function(_, opts)
		local theme_picker = require("theme-picker")
		local transparent = require("transparent")

		theme_picker.setup(opts)
		transparent.setup()

		vim.api.nvim_create_user_command("ThemePicker", function()
			theme_picker.open_theme_picker()
		end, {})
	end,
}
