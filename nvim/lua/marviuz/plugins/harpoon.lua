return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		local keymap = vim.keymap

		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add to harpoon" })
		keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon quick menu" })

		keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "harpoon select 1" })
		keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "harpoon select 2" })
		keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "harpoon select 3" })
		keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "harpoon select 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		keymap.set("n", "<C-S-,>", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<C-S-.>", function()
			harpoon:list():next()
		end)
	end,
}
