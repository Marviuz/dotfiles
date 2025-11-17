local M = {}

M.excludes = {
	-- ".git/*",
	-- ".next/*",
	-- "**/node_modules/*",
	-- "**/vendor/*",
	-- ".turbo/*",
	-- "build/*",
	-- "out/*",

	"**/.git/**",
	"**/.next/**",
	"**/node_modules/**",
	"**/vendor/**",
	"**/.turbo/**",
	"**/build/**",
	"**/out/**",
	"**/dist/**",
}

local default_opts = {
	win = {
		input = {
			keys = {
				["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
				["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
			},
		},
	},
	hidden = true,
	ignored = true,
	exclude = M.excludes,
	auto_close = true,
}

M.opts = vim.deepcopy(default_opts)

M.unsaved_buffers = function()
	local bufnrs = vim.tbl_filter(function(bufnr)
		return vim.bo[bufnr].modified
	end, vim.api.nvim_list_bufs())

	local buf_names = vim.tbl_map(function(bufnr)
		return vim.api.nvim_buf_get_name(bufnr)
	end, bufnrs)

	local items = {}

	for idx, buf in ipairs(buf_names) do
		table.insert(items, {
			idx = idx,
			name = buf,
			text = buf,
			file = buf,
		})
	end

	Snacks.picker(vim.tbl_extend("force", {}, default_opts, {
		title = "Unsaved buffers",
		items = items,
		format = function(item, _)
			return {
				{ item.text, item.text_hl, item.file },
			}
		end,
	}))
end

function M.oil_picker()
	local cwd = vim.fs.normalize(vim.uv.cwd() or ".")

	Snacks.picker({
		title = "Oil: Directories",
		format = "file",
		layout = {
			preset = "default",
			---@diagnostic disable-next-line: assign-type-mismatch
			preview = false,
		},
		cwd = cwd,
		finder = function(_, ctx)
			local args = { "--type", "directory", "--color", "never", "--hidden" }

			table.insert(args, ".")

			local proc_opts = {
				cmd = "fd",
				args = args,
				cwd = cwd,
				transform = function(item)
					item.cwd = cwd
					item.file = item.text
					item.dir = true
				end,
			}

			return require("snacks.picker.source.proc").proc({ {}, proc_opts }, ctx)
		end,
		confirm = function(picker, item)
			picker:close()
			require("oil").open(item.file)
		end,
	})
end

return M
