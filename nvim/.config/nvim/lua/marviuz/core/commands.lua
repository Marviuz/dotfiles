-- `git restore path/to/file`
vim.api.nvim_create_user_command("GitRestoreFile", function()
	local file = vim.fn.expand("%:p")
	if vim.fn.filereadable(file) == 1 then
		vim.cmd("silent! !git restore " .. vim.fn.fnameescape(file))
		vim.cmd("e!")
	else
		vim.notify("Not a readable file.", vim.log.levels.WARN)
	end
end, { desc = "Restore file to original state" })

-- `git restore --staged path/to/file`
vim.api.nvim_create_user_command("GitRestoreStagedFile", function()
	local file = vim.fn.expand("%:p")
	if vim.fn.filereadable(file) == 1 then
		vim.cmd("silent! !git restore --staged " .. vim.fn.fnameescape(file))
		vim.cmd("e!")
	else
		vim.notify("Not a readable file.", vim.log.levels.WARN)
	end
end, { desc = "Restore file to original state" })

-- `git restore --staged path/to/file`
vim.api.nvim_create_user_command("GitRestoreStagedFile", function()
	local file = vim.fn.expand("%:p")
	if vim.fn.filereadable(file) == 1 then
		vim.cmd("silent! !git restore --staged " .. vim.fn.fnameescape(file))
		vim.cmd("e!")
	else
		vim.notify("Not a readable file.", vim.log.levels.WARN)
	end
end, { desc = "Restore file to original state" })

vim.api.nvim_create_user_command("GitFullRestoreFile", function()
	local file = vim.fn.expand("%:p")
	local relative_file = vim.fn.fnamemodify(file, ":.")

	if vim.fn.filereadable(file) ~= 1 then
		vim.notify("Not a readable file.", vim.log.levels.WARN)
		return
	end

	-- Check if the file is staged
	local handle = io.popen("git diff --name-only --cached")
	local staged_output = handle and handle:read("*a") or ""
	if handle then
		handle:close()
	end

	local is_staged = false
	for line in staged_output:gmatch("[^\r\n]+") do
		if line == relative_file then
			is_staged = true
			break
		end
	end

	-- If staged, unstage it first
	if is_staged then
		vim.cmd("silent! !git restore --staged " .. vim.fn.fnameescape(file))
	end

	-- Then restore the file
	vim.cmd("silent! !git restore " .. vim.fn.fnameescape(file))
	vim.cmd("e!") -- reload the file
end, { desc = "Git restore current file (unstage if needed)" })

vim.api.nvim_create_user_command("Copy", function(opts)
	local args = vim.split(opts.args, " ")
	local scope = args[1]
	local kind = args[2]

	local value = ""

	if scope == "buffer" then
		if kind == "path" then
			value = vim.fn.expand("%:p")
		elseif kind == "relpath" then
			value = vim.fn.expand("%")
		elseif kind == "filename" then
			value = vim.fn.expand("%:t")
		else
			print("Unknown buffer option: " .. (kind or ""))
			return
		end
	else
		print("Unknown scope: " .. (scope or ""))
		return
	end

	vim.fn.setreg("+", value)
	print("Copied: " .. value)
end, {
	nargs = "+",
	complete = function(_, line)
		local parts = vim.split(line, " ")
		if #parts == 2 then
			return { "buffer" }
		elseif #parts == 3 and parts[2] == "buffer" then
			return { "path", "relpath", "filename" }
		end
		return {}
	end,
})
