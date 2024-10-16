local colorschemes = {
	{
		name = "Nightfox",
		colorscheme = "carbonfox",
		before = function()
			local nightfox = require("nightfox")

			nightfox.setup({
				options = {
					transparent = true,
				},
			})
		end,
	},
	{
		name = "Catppuccin",
		colorscheme = "catppuccin-mocha",
		before = function()
			local catppuccin = require("catppuccin")

			catppuccin.setup({
				transparent_background = true,
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
			})
		end,
	},
	{
		name = "Kanagawa Dragon",
		colorscheme = "kanagawa-dragon",
		before = function()
			local kanagawa = require("kanagawa")

			kanagawa.setup({
				transparent = true,
			})
		end,
	},
	{
		name = "Kanagawa Wave",
		colorscheme = "kanagawa-wave",
		before = function()
			local kanagawa = require("kanagawa")

			kanagawa.setup({
				transparent = true,
			})
		end,
	},
	{
		name = "Tokyonight",
		colorscheme = "tokyonight",
		before = function()
			local tokyonight = require("tokyonight")

			tokyonight.setup({
				on_colors = function(colors) end,
				style = "night",
				transparent = true,
				on_highlights = function(hl)
					hl.TelescopeNormal.bg = "none"
					hl.TelescopeBorder.bg = "none"
					hl.TelescopePromptBorder.bg = "none"
				end,
			})
		end,
	},
	{
		name = "Bluimandres",
		colorscheme = "bluimandres",
		before = function()
			local bluimandres = require("bluimandres")

			bluimandres.setup({
				disable_background = true,
			})
		end,
	},
	{
		name = "Poimandres",
		colorscheme = "poimandres",
		before = function()
			local poimandres = require("poimandres")
			poimandres.setup({
				disable_background = true,
			})
		end,
	},
	{
		name = "VSCode Modern",
		colorscheme = "vscode_modern",
		before = function()
			local vscode_modern = require("vscode_modern")

			vscode_modern.setup({
				transparent_background = true,
			})
		end,
	},
	{
		name = "VSCode",
		colorscheme = "vscode",
		before = function()
			local vscode = require("vscode")

			vscode.setup({
				style = "dark",
				transparent = true,
				italic_comments = true,
				underline_links = true,
				disable_nvimtree_bg = true,
			})
		end,
	},
	{
		name = "Fleet",
		colorscheme = "fleet",
	},
	{
		name = "Midnight",
		colorscheme = "midnight",
	},
	{
		name = "Cyberdream",
		colorscheme = "cyberdream",
		before = function()
			local cyberdream = require("cyberdream")

			cyberdream.setup({
				transparent = true,
			})
		end,
	},
	{
		name = "Nord",
		colorscheme = "nord",
		before = function()
			vim.g.nord_disable_background = true
		end,
	},
	{
		name = "Nordic",
		colorscheme = "nordic",
		before = function()
			local nordic = require("nordic")

			nordic.setup({
				transparent = {
					bg = true,
				},
			})
		end,
	},
	{
		name = "Moonfly",
		colorscheme = "moonfly",
		before = function()
			vim.g.moonflyTransparent = true
		end,
	},
	{
		name = "Lackluster Hack",
		colorscheme = "lackluster-hack",
		before = function()
			local lackluster = require("lackluster")

			lackluster.setup({
				tweak_background = {
					normal = "none",
				},
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
		"EdenEast/nightfox.nvim",
		"felipeagc/fleet-theme-nvim",
		"catppuccin/nvim",
		"rebelot/kanagawa.nvim",
		"olivercederborg/poimandres.nvim",
		"Mofiqul/vscode.nvim",
		"folke/tokyonight.nvim",
		"Marviuz/bluimandres.nvim",
		"dasupradyumna/midnight.nvim",
		"gmr458/vscode_modern_theme.nvim",
		"scottmckendry/cyberdream.nvim",
		"shaunsingh/nord.nvim",
		"AlexvZyl/nordic.nvim",
		{ "bluz71/vim-moonfly-colors", name = "moonfly" },
		"slugbyte/lackluster.nvim",
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

		theme_picker.setup(opts)

		vim.api.nvim_create_user_command("ThemePicker", function()
			theme_picker.open_theme_picker()
		end, {})
	end,
}
