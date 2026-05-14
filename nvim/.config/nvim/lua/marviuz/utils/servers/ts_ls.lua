local map = require("marviuz.utils.map")

return {
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
}