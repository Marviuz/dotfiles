-- return {
-- 	"christoomey/vim-tmux-navigator",
-- }
return {
	"numToStr/Navigator.nvim",
	config = function()
		local navigator = require("Navigator")
		local map = require("marviuz.utils.map")

		navigator.setup({
			mux = "auto",
			disable_on_zoom = false,
		})

		map({ "n", "t" }, "<C-h>", navigator.left, { desc = "Navigate left" })
		map({ "n", "t" }, "<C-j>", navigator.down, { desc = "Navigate down" })
		map({ "n", "t" }, "<C-k>", navigator.up, { desc = "Navigate up" })
		map({ "n", "t" }, "<C-l>", navigator.right, { desc = "Navigate right" })
	end,
}
