local map = require("marviuz.utils.map")

return {
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
					map({ "n", "v" }, "<leader>me", ":LspEslintFixAll<cr>", { desc = "Run :LspEslintFixAll" })
				end
			end,
		})
	end,
}