if vim.fn.has("macunix") then
	vim.api.nvim_exec("language en_US", true)
end

vim.loader.enable()

require("marviuz.core")
require("marviuz.lazy")
