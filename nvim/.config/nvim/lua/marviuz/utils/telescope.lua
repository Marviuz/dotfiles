local M = {}

M.excludes = {
	".git/*",
	".next/*",
	"**/node_modules/*",
	"**/vendor/*",
	".turbo/*",
	"build/*",
	"out/*",
}

M.exclude_patterns = "!{" .. table.concat(M.excludes, ",") .. "}"

M.select_find_command = function()
	local executable = vim.fn.executable

	local rg_command = {
		initial_mode = "insert",
		hidden = true,
		no_ignore = true,
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
			-- "!{.git/*,.next/*,node_modules/*}",
			M.exclude_patterns,
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
			-- "!{.git/*,.next/*,node_modules/*}",
			M.exclude_patterns,
		},
	}

	if executable ~= 1 then
		return rg_command
	else
		return fd_command
	end
end

M.unsaved_buffers = function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values

	local bufnrs = vim.tbl_filter(function(bufnr)
		return vim.bo[bufnr].modified
	end, vim.api.nvim_list_bufs())

	local buf_names = vim.tbl_map(function(bufnr)
		return vim.api.nvim_buf_get_name(bufnr)
	end, bufnrs)

	pickers
		.new({}, {
			prompt_title = "Unsaved Buffers",
			finder = finders.new_table({
				results = buf_names,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(bufnr, map)
				local function open_file()
					local selection = action_state.get_selected_entry()
					actions.close(bufnr)
					-- if selection then
					-- 	local file_path = selection.value
					-- 	local normalized_path = string.gsub(file_path, "\\", "/")
					-- 	vim.cmd("edit " .. vim.fn.fnameescape(normalized_path))
					-- end
					vim.cmd("edit " .. vim.fn.fnameescape(selection.value))
				end
				map("i", "<CR>", open_file)
				return true
			end,
		})
		:find()
end

return M
