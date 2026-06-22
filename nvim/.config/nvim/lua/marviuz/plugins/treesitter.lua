return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	dependencies = {
		"windwp/nvim-ts-autotag",
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
		},
		"hrsh7th/nvim-anydent",
	},
	config = function()
		local treesitter = require("nvim-treesitter")
		local auto_tag = require("nvim-ts-autotag")

		local ensureInstalled = {
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

		treesitter.install(ensureInstalled)

		treesitter.setup({
			incremental_selection = {
				enable = true,
				scope_incremental = true,
				keymaps = {
					init_selection = "gn",
					node_incremental = "gn",
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
				},
			},
		})

		auto_tag.setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local buf = args.buf
				local ft = vim.bo[buf].filetype

				local lang = vim.treesitter.language.get_lang(ft)

				if not lang then
					return
				end

				pcall(vim.treesitter.start, buf, lang)

				-- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				require("anydent").attach()
			end,
		})

		vim.filetype.add({
			extension = {
				mdx = "mdx",
			},
		})

		vim.treesitter.language.register("markdown", "mdx")
	end,
}
