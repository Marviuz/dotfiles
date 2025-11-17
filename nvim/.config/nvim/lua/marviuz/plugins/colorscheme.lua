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
	{
		name = "Darkvoid",
		colorscheme = "darkvoid",
	},
	{
		name = "Eidolon - Midnight",
		colorscheme = "eidolon-midnight",
	},
	{
		name = "Eidolon - Twilight",
		colorscheme = "eidolon-twilight",
	},
	{
		name = "Eidolon - Dusk",
		colorscheme = "eidolon-dusk",
	},
	{
		name = "Zenbones",
		colorscheme = "zenbones",
	},
	{
		name = "Zenbones - zenwritten",
		colorscheme = "zenwritten",
	},
	{
		name = "Zenbones - neobones",
		colorscheme = "neobones",
	},
	{
		name = "Zenbones - vimbones",
		colorscheme = "vimbones",
	},
	{
		name = "Zenbones - rosebones",
		colorscheme = "rosebones",
	},
	{
		name = "Zenbones - forestbones",
		colorscheme = "forestbones",
	},
	{
		name = "Zenbones - nordbones",
		colorscheme = "nordbones",
	},
	{
		name = "Zenbones - tokyobones",
		colorscheme = "tokyobones",
	},
	{
		name = "Zenbones - seoulbones",
		colorscheme = "seoulbones",
	},
	{
		name = "Zenbones - duckbones",
		colorscheme = "duckbones",
	},
	{
		name = "Zenbones - zenburned",
		colorscheme = "zenburned",
	},
	{
		name = "Zenbones - kanagawabones",
		colorscheme = "kanagawabones",
	},
	{
		name = "VSCode",
		colorscheme = "vscode",
	},
	{
		name = "Tokyonight",
		colorscheme = "tokyonight",
	},
	{
		name = "Tokyonight - Night",
		colorscheme = "tokyonight-night",
	},
	{
		name = "Tokyonight - Storm",
		colorscheme = "tokyonight-storm",
	},
	{
		name = "Tokyonight - Moon",
		colorscheme = "tokyonight-moon",
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
		"dark-orchid/neovim",
		"aliqyan-21/darkvoid.nvim",
		"Vallen217/eidolon.nvim",
		"Mofiqul/vscode.nvim",
		"folke/tokyonight.nvim",

		"zenbones-theme/zenbones.nvim",
		"rktjmp/lush.nvim",
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
