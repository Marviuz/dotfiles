return {
	"mbbill/undotree",
	config = function()
		local map = require("marviuz.utils.map")

		-- vim.g.undotree_DiffCommand = "FC"

		map("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
	end,
}
