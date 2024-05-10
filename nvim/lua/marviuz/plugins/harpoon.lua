return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local map = require("marviuz.utils.map")

		harpoon:setup()

		map("n", "<leader>a", function()
			harpoon:list():add()
			vim.notify("Added to harpoon")
		end, { desc = "Add to harpoon" })
		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon quick menu" })

		map("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "harpoon select 1" })
		map("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "harpoon select 2" })
		map("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "harpoon select 3" })
		map("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "harpoon select 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<C-S-,>", function()
			harpoon:list():prev()
		end)
		map("n", "<C-S-.>", function()
			harpoon:list():next()
		end)
	end,
}
