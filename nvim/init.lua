vim.api.nvim_exec("language en_US", true)

vim.loader.enable()

require("marviuz.core")
require("marviuz.lazy")

vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1
    augroup END
]])
