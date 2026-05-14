return {
	"nvim-mini/mini.ai",
	version = "*",
	config = function()
		local ai = require("mini.ai")
		ai.setup({
			custom_textobjects = {
				f = ai.gen_spec.treesitter({
					a = "@function.outer",
					i = "@block.inner",
				}),
			},
		})
	end,
}
