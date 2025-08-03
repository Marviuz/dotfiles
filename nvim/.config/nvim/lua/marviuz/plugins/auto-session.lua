return {
	"rmagatti/auto-session",
	config = function()
		local auto_sessions = require("auto-session")

		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		auto_sessions.setup({
			auto_session_enabled = true,
			auto_restore = false,
			auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
		})
	end,
}
