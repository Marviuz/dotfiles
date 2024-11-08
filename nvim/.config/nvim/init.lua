-- Workfor inconsistent behavior of vim.fn.fnameescape on Windows
-- @link https://youtu.be/ZqPpBfiX9ws?t=166
if vim.fn.has("win32") then
	local og_fnameescape = vim.fn.fnameescape

	---@diagnostic disable-next-line: duplicate-set-field
	vim.fn.fnameescape = function(...)
		local result = og_fnameescape(...)
		return result:gsub("\\", "/")
	end
end

vim.cmd("language en_US.UTF-8")

vim.loader.enable()

require("marviuz.core")
require("marviuz.lazy")

vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1
    augroup END
]])
