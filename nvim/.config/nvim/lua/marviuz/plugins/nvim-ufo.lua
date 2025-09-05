return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			local ufo = require("ufo")
			local map = require("marviuz.utils.map")

			ufo.setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
				open_fold_hl_timeout = 0,
			})

			vim.o.foldenable = true
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- za to fold at cursor location is already enabled
			map("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
			map("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
		end,
	},
}
