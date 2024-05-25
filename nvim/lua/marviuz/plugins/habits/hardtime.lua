return {
	"m4xshen/hardtime.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		vim.opt.showmode = false
		local hardtime = require("hardtime")
		hardtime.setup()
	end,
}
