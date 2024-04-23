return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-\>]],
			direction = "float",
		},
		config = function(_, opts)
			local toggleterm = require("toggleterm")

			local powershell_options = {
				shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
				shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
				shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
				shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
				shellquote = "",
				shellxquote = "",
			}

			local keymap = vim.keymap

			for option, value in pairs(powershell_options) do
				vim.opt[option] = value
			end

			toggleterm.setup(opts)

			keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle floating terminal" })
		end,
	},
}
