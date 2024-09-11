function get_filename(path)
	local lastSlashForward = path:match(".*[/\\]([^/\\]*)$")
	local lastSlashBackward = path:match(".*[\\/]([^\\/]+)$")

	local lastSlash = lastSlashForward or lastSlashBackward

	if lastSlash then
		return lastSlash
	else
		return path
	end
end

local function get_harpoon_indicator(append_str)
	return function(harpoon_entry)
		return append_str .. get_filename(harpoon_entry.value)
	end
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
		},
		"letieu/harpoon-lualine",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local harpoon = require("harpoon")
		local map = require("marviuz.utils.map")

		local indicator_symbols = { "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨" }
		local indicators = {}
		local active_indicators = {}

		for idx, indicator in ipairs(indicator_symbols) do
			indicators[idx] = get_harpoon_indicator(indicator .. " ")
		end

		for idx, indicator in ipairs(indicator_symbols) do
			active_indicators[idx] = get_harpoon_indicator("● ")
		end

		lualine.setup({
			options = {
				section_separators = { left = "" },
			},
			tabline = {
				lualine_a = {
					{
						"harpoon2",
						indicators = indicators,
						active_indicators = active_indicators,
						_separator = " ",
					},
				},
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})

		map("n", "<leader>a", function()
			harpoon:list():add()
			vim.notify("Added to harpoon")
		end, { desc = "Add to harpoon" })
		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon quick menu" })

		for idx, _ in ipairs(indicator_symbols) do
			map("n", "<leader>" .. idx, function()
				harpoon:list():select(idx)
			end, { desc = "harpoon select " .. idx })
		end

		-- map("n", "<leader>1", function()
		-- 	harpoon:list():select(1)
		-- end, { desc = "harpoon select 1" })
		-- map("n", "<leader>2", function()
		-- 	harpoon:list():select(2)
		-- end, { desc = "harpoon select 2" })
		-- map("n", "<leader>3", function()
		-- 	harpoon:list():select(3)
		-- end, { desc = "harpoon select 3" })
		-- map("n", "<leader>4", function()
		-- 	harpoon:list():select(4)
		-- end, { desc = "harpoon select 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<C-S-,>", function()
			harpoon:list():prev()
		end)
		map("n", "<C-S-.>", function()
			harpoon:list():next()
		end)
	end,
}
