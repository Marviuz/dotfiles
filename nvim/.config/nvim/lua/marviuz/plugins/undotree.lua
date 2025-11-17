return {
	"mbbill/undotree",
	config = function()
		local map = require("marviuz.utils.map")
		local _os = require("marviuz.utils.os")
		local is_windows = _os.is_windows()

		if is_windows then
			vim.g.undotree_DiffCommand = "FC"
		end

		map("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
	end,
}
