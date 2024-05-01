return {
	"mbbill/undotree",
	config = function()
		local map = require("marviuz.utils.map")

		map("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
	end,
}
