return {
	"romus204/tree-sitter-manager.nvim",
	config = function()
		local ts_manager = require("tree-sitter-manager")

		local ensure_installed = {
			"angular",
			"bash",
			"css",
			"dockerfile",
			"gitignore",
			"html",
			"hyprlang",
			"javascript",
			"json",
			"jsx",
			"lua",
			"markdown",
			"php",
			"prisma",
			"regex",
			"rust",
			"svelte",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
		}

		ts_manager.setup({
			highlight = true,
			auto_install = true,
			ensure_installed = ensure_installed,
		})
	end,
}
