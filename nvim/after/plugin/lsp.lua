local lsp = require("lsp-zero").preset({})
local navic = require("nvim-navic")

local navic_on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	navic_on_attach(client, bufnr)
end)

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"html",
	"cssls",
	"jsonls",
	"lua_ls",
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

-- You need to setup `cmp` after lsp-zero
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		["<C-Space>"] = cmp.mapping.complete(),

		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
	},
})

local null_ls = require("null-ls")

local null_opts = lsp.build_options("null-ls", {
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ name = 'null-ls' })")
		end
	end,
})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
	on_attach = null_opts.on_attach,
	sources = {
		-- formatting
		formatting.prettier,
		formatting.stylua,

		-- linting
		lint.eslint,

		-- code actions
		action.eslint,
	},
})

lsp.setup()
