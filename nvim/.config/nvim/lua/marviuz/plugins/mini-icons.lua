return {
	"nvim-mini/mini.icons",
	config = function()
		local MiniIcons = require("mini.icons")

		MiniIcons.setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
}
