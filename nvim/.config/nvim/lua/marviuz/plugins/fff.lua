return {
	"dmtrKovalenko/fff.nvim",
	enabled = true,
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	lazy = false,
	config = function()
		require("fff").setup({
			layout = {
				prompt_position = "top",
				preview_position = "right",
			},
			preview = {
				enabled = true,
				show_file_info = true,
				history = {
					enabled = true,
				},
			},
			keymaps = {
				-- 	close = { "<C-c>", "<Esc>" },
				-- 	select = "<CR>",
				-- 	select_split = "<C-s>",
				-- 	select_vsplit = "<C-v>",
				-- 	select_tab = "<C-t>",
				-- 	-- Multiple bindings supported
				move_up = { "<C-k>" },
				move_down = { "<C-j>" },
				preview_scroll_up = "<C-u>",
				preview_scroll_down = "<C-d>",
			},
			git = {
				status_text_color = true,
			},
			-- Highlight groups
			-- hl = {
			-- 	border = "FloatBorder",
			-- 	normal = "Normal",
			-- 	cursor = "CursorLine",
			-- 	matched = "IncSearch",
			-- 	title = "Title",
			-- 	prompt = "Question",
			-- 	active_file = "Visual",
			-- 	frecency = "Number",
			-- 	debug = "Comment",
			-- 	git_staged = "FFFGitStaged", -- Files staged for commit
			-- 	git_modified = "FFFGitModified", -- Modified unstaged files
			-- 	git_deleted = "FFFGitDeleted", -- Deleted files
			-- 	git_renamed = "FFFGitRenamed", -- Renamed files
			-- 	git_untracked = "FFFGitUntracked", -- New untracked files
			-- 	git_ignored = "FFFGitIgnored", -- Git-ignored files
			-- },
			frecency = {
				enabled = true,
			},
			history = {
				enabled = true,
			},
		})
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "Open file picker",
		},
		{
			"<leader>fs",
			function()
				require("fff").live_grep({
					grep = {
						modes = { "plain", "fuzzy" },
					},
				})
			end,
			desc = "Live fffuzy grep word",
		},
		{
			"<leader>fc",
			function()
				require("fff").find_files_in_dir("~/dotfiles/nvim/.config/nvim")
			end,
			desc = "Fsdfind config files",
		},
		{
			"<leader>fn",
			function()
				require("fff").find_files_in_dir("~/Projects/marviuz/obsidian-notes")
			end,
			desc = "Find config files",
		},
	},
}
