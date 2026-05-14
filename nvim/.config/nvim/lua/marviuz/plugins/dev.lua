return {
	dir = "~/Projects/marviuz/marviuz-nvim-utils.nvim",
	config = function()
		local mvu = require("marviuz-nvim-utils")
		local marker = require("marviuz-nvim-utils.marker")

		local map = require("marviuz.utils.map")

		mvu.setup()
		marker.setup()

		map("n", "<leader>ma", function()
			marker.mark()
		end, { desc = "Marker toggle" })

		map("n", "<leader>mm", function()
			marker.toggle_marker_window(function(bufnr)
				-- Setup keymaps for the opened buffer
				map("n", "q", function()
					marker.toggle_marker_window()
				end, { buffer = bufnr })

				map("n", "<leader>w", function()
					marker.save_window()
				end, { desc = "Save and exit markers", buffer = bufnr })

				map("n", "<CR>", function()
					marker.select()
				end, { buffer = bufnr })
			end)
		end, { desc = "Open markers" })

		for idx = 0, 9 do
			map("n", "<leader>m" .. idx, function()
				marker.jump({ index = idx })
			end, { desc = "Marker jump " .. idx })
		end
	end,
}
