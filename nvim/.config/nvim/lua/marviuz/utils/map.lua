local function map(mode, lhs, rhs, opts)
	local default_opts = { noremap = true, silent = true }

	if opts then
		opts = vim.tbl_extend("force", default_opts, opts)
	else
		opts = default_opts
	end

	vim.keymap.set(mode, lhs, rhs, opts)
end

return map
