local transparent_enabled = vim.g.transparent_enabled

local colorschemes = {
	{
		name = "Nightfox",
		colorscheme = "carbonfox",
		before = function()
			local nightfox = require("nightfox")

			nightfox.setup({
				options = {
					transparent = transparent_enabled,
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
				transparent_background = transparent_enabled,
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
				transparent = transparent_enabled,
			})
		end,
	},
	{
		name = "Kanagawa Wave",
		colorscheme = "kanagawa-wave",
		before = function()
			local kanagawa = require("kanagawa")

			kanagawa.setup({
				transparent = transparent_enabled,
			})
		end,
	},
	{
		name = "Tokyonight",
		colorscheme = "tokyonight",
		before = function()
			local tokyonight = require("tokyonight")

			tokyonight.setup({
				on_colors = function() end,
				style = "night",
				transparent = transparent_enabled,
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
				disable_background = transparent_enabled,
			})
		end,
	},
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
		name = "VSCode",
		colorscheme = "vscode",
		before = function()
			local vscode = require("vscode")

			vscode.setup({
				style = "dark",
				transparent = transparent_enabled,
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
				lightmode = false,
				ignore_filetype = {},
				transparent = transparent_enabled,
			})
		end,
	},
	{
		name = "Nord",
		colorscheme = "nord",
		before = function()
			vim.g.nord_disable_background = transparent_enabled
		end,
	},
	{
		name = "Nordic",
		colorscheme = "nordic",
		before = function()
			local nordic = require("nordic")

			nordic.setup({
				transparent = {
					bg = transparent_enabled,
				},
			})
		end,
	},
	{
		name = "Moonfly",
		colorscheme = "moonfly",
		before = function()
			vim.g.moonflyTransparent = transparent_enabled
		end,
	},
	{
		name = "Lackluster Hack",
		colorscheme = "lackluster-hack",
		before = function()
			local lackluster = require("lackluster")

			lackluster.setup({
				disable_plugin = {},
				tweak_background = {
					normal = "none",
				},
			})
		end,
	},
	{
		name = "Oxocarbon",
		colorscheme = "oxocarbon",
		before = function()
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end,
	},
	{
		name = "Nightowl",
		colorscheme = "night-owl",
		before = function()
			local night_owl = require("night-owl")

			night_owl.setup({
				lightmode = false,
				ignore_filetype = {},
				transparent_background = transparent_enabled,
			})
		end,
	},
	{
		name = "No Clown Fiesta",
		colorscheme = "no-clown-fiesta",
		before = function()
			local no_clown_fiesta = require("no-clown-fiesta")

			no_clown_fiesta.setup({
				transparent = transparent_enabled,
			})
		end,
	},
	{
		name = "Yugen",
		colorscheme = "yugen",
	},
	{
		name = "Rasmus",
		colorscheme = "rasmus",
		before = function()
			vim.g.rasmus_transparent = transparent_enabled
		end,
	},
	{
		name = "Neg",
		colorscheme = "neg",
	},
	{
		name = "Nyctophilia Nox",
		colorscheme = "nox",
	},
	{
		name = "Nyctophilia Umbra",
		colorscheme = "umbra",
	},
	{
		name = "Nyctophilia Nebula",
		colorscheme = "nebula",
	},
	{
		name = "Nyctophilia Tenebra",
		colorscheme = "tenebra",
	},
	{
		name = "Iceberg",
		colorscheme = "iceberg",
	},
}

table.sort(colorschemes, function(a, b)
	return a.name < b.name
end)

return {
	"panghu-huang/theme-picker.nvim",
	dependencies = {
		"xiyaowong/transparent.nvim",
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
		"nyoom-engineering/oxocarbon.nvim",
		"oxfist/night-owl.nvim",
		"aktersnurra/no-clown-fiesta.nvim",
		"bettervim/yugen.nvim",
		"kvrohit/rasmus.nvim",
		"neg-serg/neg.nvim",
		"javiorfo/nvim-nyctophilia",
		"oahlen/iceberg.nvim",
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
