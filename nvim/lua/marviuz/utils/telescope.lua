local M = {}

-- Optimized for nextJS development
M.select_find_command = function()
	local executable = vim.fn.executable

	local rg_command = {
		initial_mode = "insert",
		hidden = true,
		no_ignore = true,
		file_ignore_patterns = {
			"node_modules",
			".git",
			"build",
		},
		find_command = {
			"rg",
			"--files",
			"--color=never",
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!{.git/*,.next/*,node_modules/*}",
			"--path-separator",
			"/",
		},
	}

	local fd_command = {
		initial_mode = "insert",
		find_command = vim.fn.executable == 1 and {
			"fd",
			"--type=f",
			"--color=never",
			"--path-separator=/",
			"--hidden",
			"--include",
			"lua/**/user/*",
			"--exclude",
			"!{.git/*,.next/*,node_modules/*}",
		},
	}

	if executable ~= 1 then
		return rg_command
	else
		return fd_command
	end
end

return M
