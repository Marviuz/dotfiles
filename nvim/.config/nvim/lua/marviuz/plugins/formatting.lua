return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo", "Format", "PrettierdReload" },
	config = function()
		local conform = require("conform")
		local map = require("marviuz.utils.map")

		local function find_up(names, start_dir)
			return vim.fs.find(names, { upward = true, path = start_dir, stop = vim.env.HOME })[1]
		end

		local function uses_vite_plus(start_dir)
			local cfg = find_up({ "vite.config.ts", "vite.config.mts", "vite.config.js", "vite.config.mjs" }, start_dir)
			if not cfg then
				return false
			end
			local f = io.open(cfg, "r")
			if not f then
				return false
			end
			local content = f:read("*a")
			f:close()
			local found = content:find("vite-plus", 1, true) ~= nil
			vim.notify(("vite-plus detected in %s: %s"):format(cfg, tostring(found)), vim.log.levels.INFO)
			return found
		end

		local function web_formatters(bufnr)
			local bufpath = vim.api.nvim_buf_get_name(bufnr)
			local start_dir = bufpath ~= "" and vim.fn.fnamemodify(bufpath, ":h") or nil

			if uses_vite_plus(start_dir) then
				if find_up({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, start_dir) then
					return { "oxfmt", "vp_fmt", stop_after_first = true }
				end
				return { "vp_fmt" }
			end

			if find_up({ "biome.json", "biome.jsonc" }, start_dir) then
				return { "biome-check", stop_after_first = true }
			end
			return { "prettierd", "prettier", stop_after_first = true }
		end

		conform.setup({
			formatters = {
				vp_fmt = {
					command = "vp",
					args = { "fmt", "--stdin-filepath", "$FILENAME" },
				},
			},
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
