return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo", "Format", "PrettierdReload" },
	config = function()
		local conform = require("conform")
		local map = require("marviuz.utils.map")

		local function first(bufnr, ...)
			for i = 1, select("#", ...) do
				local formatter = select(i, ...)
				if conform.get_formatter_info(formatter, bufnr).available then
					return formatter
				end
			end
			return select(1, ...)
		end

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				svelte = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				css = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				scss = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				sass = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				html = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				htmlangular = { "prettierd", "prettier" },
				json = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				yaml = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				markdown = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				mdx = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				vue = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				php = { "phpcbf" }, -- or "php_cs_fixer"
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 10000,
			-- },
		})

		map({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 10000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
