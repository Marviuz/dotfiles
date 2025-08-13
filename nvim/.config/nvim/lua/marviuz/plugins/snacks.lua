return {
	"folke/snacks.nvim",
	version = "*",
	dependencies = {
		{ "echasnovski/mini.icons", version = "*" },
	},
	config = function()
		local Snacks = require("snacks")

		local map = require("marviuz.utils.map")
		local snacks_util = require("marviuz.utils.snacks")

		map("n", "<leader>ff", function()
			Snacks.picker.files(snacks_util.opts)
		end, { desc = "Open files using snacks" })

		map("n", "<leader>fs", function()
			Snacks.picker.grep(snacks_util.opts)
		end, { desc = "Grep using snacks" })

		map("n", "<leader>gs", function()
			Snacks.picker.git_status(snacks_util.opts)
		end, { desc = "Git status" })

		map("n", "<leader>ub", function()
			snacks_util.unsaved_buffers()
		end, { desc = "View unsaved buffer" })

		map("n", "<space>gb", function()
			Snacks.picker.git_branches()
		end, { desc = "Git branches" })

		-- LSP
		map("n", "gR", function()
			Snacks.picker.lsp_references(snacks_util.opts)
		end, { desc = "Show LSP references" })

		map("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { desc = "Go to definition" })

		map("n", "<leader>fd", function()
			snacks_util.oil_picker()
		end, { desc = "Find directory" })
	end,
}
