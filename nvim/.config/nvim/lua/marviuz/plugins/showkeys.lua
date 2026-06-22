return {
	"nvzone/showkeys",
	lazy = false,
	cmd = "ShowkeysToggle",
	config = function()
		local showkeys = require("showkeys")

		showkeys.setup({
			position = "top-right",
			maxkeys = 3,
			show_count = true,
			winopts = {
				focusable = false,
				relative = "editor",
				style = "minimal",
				border = "single",
				height = 1,
				row = 1,
				col = 0,
			},
		})
	end,
}
