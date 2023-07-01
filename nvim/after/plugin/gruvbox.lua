-- setup must be called before loading the colorscheme
-- Default options:

vim.o.background = "dark"

require("gruvbox").setup({
	contrast = "hard", -- can be "hard", "soft" or empty string
	transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
