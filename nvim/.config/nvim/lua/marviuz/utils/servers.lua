local map = require("marviuz.utils.map")

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				completion = { callSnippet = "Replace" },
			},
		},
	},

	eslint = {
		on_new_config = function(config, new_root_dir)
			config.settings.workspaceFolder = {
				uri = vim.uri_from_fname(new_root_dir),
				name = vim.fn.fnamemodify(new_root_dir, ":t"),
			}
		end,
		setup_extra = function()
			map({ "n", "v" }, "<leader>me", ":EslintFixAll<cr>", { desc = "Run :EslintFixAll" })
		end,
	},

	ts_ls = {
		commands = {
			OrganizeImports = {
				function()
					local bufnr = vim.api.nvim_get_current_buf()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "",
					}

					for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
						if client.name == "ts_ls" then
							client:request("workspace/executeCommand", params, nil, bufnr)
							return
						end
					end

					vim.notify("No active ts_ls client found", vim.log.levels.WARN)

					-- vim.lsp.buf.execute_command(params)
				end,
				description = "Organize Imports",
			},
		},
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"typescript",
			"javascript",
			"mdx",
			"vue",
		},
		setup_extra = function()
			map("n", "<leader>oi", "<cmd>OrganizeImports<CR>", { desc = "Organize imports" })
		end,
	},

	tailwindcss = {
		settings = {
			tailwindCSS = {
				experimental = {
					classRegex = {
						{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
						{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					},
				},
			},
		},
	},

	mdx_analyzer = {
		filetypes = { "mdx" },
		-- init_options = {
		-- 	typescript = {},
		-- },
		-- on_new_config = function(new_config, new_root_dir)
		-- 	if vim.tbl_get(new_config.init_options, "typescript") and not new_config.init_options.typescript.sdk then
		-- 		local project_root = vim.fs.dirname(vim.fs.find("node_modules", { path = "./", upward = true })[1])
		-- 		new_config.init_options.typescript.tsdk = project_root and (table.concat({ "path1", "path2" })) or ""
		-- 	end
		-- end,
	},

	emmet_ls = {
		filetypes = {
			"htmlangular",
			"html",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
		},
	},

	vue_ls = {
		filetypes = {
			"vue",
		},
	},
	angularls = {},

	intelephense = {
		filetypes = { "php" },
	},

	laravel_ls = {},

	marksman = {},
}

return servers
