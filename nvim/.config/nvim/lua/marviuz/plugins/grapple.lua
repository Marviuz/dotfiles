return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", version = "*" },
	},
	config = function()
		local map = require("marviuz.utils.map")
		local grapple = require("grapple")

		grapple.setup()

		map("n", "<leader>a", function()
			grapple.tag()
			vim.notify("Added to Grapple")
		end, { desc = "Add to Grapple" })

		map("n", "<C-e>", function()
			grapple.open_tags()
		end, { desc = "Grapple quick menu" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "grapple",
			callback = function()
				map("n", "<leader>w", "<cmd>close<cr>", {
          desc = "Close Grapple",
					buffer = true,
					silent = true,
				})
			end,
		})

		for idx = 0, 9 do
			map("n", "<leader>" .. idx, function()
				grapple.select({ index = idx })
			end, { desc = "Grapple select " .. idx })
		end
	end,
}
