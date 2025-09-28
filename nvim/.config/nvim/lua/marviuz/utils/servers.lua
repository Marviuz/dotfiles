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
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.name == "eslint" then
						map({ "n", "v" }, "<leader>me", ":EslintFixAll<cr>", { desc = "Run :EslintFixAll" })
					end
				end,
			})
		end,
	},

	biome = {},

	ts_ls = {
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"typescript",
			"javascript",
			"mdx",
			"vue",
		},
		setup_extra = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("ts_ls.lsp", { clear = true }),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					local bufnr = args.buf

					if client.name == "ts_ls" then
						map("n", "<leader>oi", function()
							client:exec_cmd({
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(bufnr) },
							})
						end, { desc = "Organize imports" })

						map("n", "<leader>ri", function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									diagnostics = {},
									only = { "source.removeUnusedImports.ts" },
								},
							})
						end, { desc = "Organize imports" })
					end
				end,
			})
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

	angularls = {
		root_markers = {
			"angular.json",
			"nx.json",
		},
	},

	intelephense = {
		filetypes = { "php" },
	},

	laravel_ls = {},

	marksman = {},
}

return servers
