return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo", "Format", "PrettierdReload" },
	config = function()
		local conform = require("conform")
		local map = require("marviuz.utils.map")

		local function web_formatters(bufnr)
			local bufpath = vim.api.nvim_buf_get_name(bufnr)
			local start_dir = bufpath ~= "" and vim.fn.fnamemodify(bufpath, ":h") or nil
			local biome_cfg = vim.fs.find({ "biome.json", "biome.jsonc" }, {
				upward = true,
				path = start_dir,
				stop = vim.env.HOME,
			})[1]
			if biome_cfg then
				return { "biome-check", stop_after_first = true }
			end
			return { "prettierd", "prettier", stop_after_first = true }
		end

		conform.setup({
			formatters_by_ft = {
				javascript = web_formatters,
				typescript = web_formatters,
				javascriptreact = web_formatters,
				typescriptreact = web_formatters,
				svelte = web_formatters,
				css = web_formatters,
				scss = web_formatters,
				sass = web_formatters,
				html = web_formatters,
				htmlangular = web_formatters,
				json = web_formatters,
				yaml = web_formatters,
				markdown = web_formatters,
				mdx = web_formatters,
				vue = web_formatters,
				lua = { "stylua" },
				php = { "phpcbf" },
			},
		})

		map({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 10000,
			})

			if vim.fn.exists(":LspEslintFixAll") == 2 then
				vim.cmd("LspEslintFixAll")
			end
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
