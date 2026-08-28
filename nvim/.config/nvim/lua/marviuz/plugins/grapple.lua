return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-mini/mini.icons", version = "*" },
	},
	config = function()
		local map = require("marviuz.utils.map")
		local grapple = require("grapple")

		local MAX_TAGS = 4

		grapple.setup()

		-- map("n", "<leader>a", function()
		-- 	grapple.tag()
		-- 	vim.notify("Added to Grapple")
		-- end, { desc = "Add to Grapple" })

		map("n", "<leader>a", function()
			local tags = grapple.tags() -- Get current tags for the project
			if #tags >= MAX_TAGS and not grapple.exists() then
				local oldest = tags[1]
				grapple.untag({ path = oldest.path })
			end

			grapple.tag()
			vim.notify("Grapple: Tagged (FIFO)", vim.log.levels.INFO)
		end, { desc = "Add to Grapple (FIFO)" })

		map("n", "<C-e>", function()
			grapple.open_tags()
		end, { desc = "Grapple quick menu" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "grapple",
			callback = function()
				map("n", "<leader>w", "<cmd>close<cr>", {
					desc = "Close Grapple",
					buffer = true,
					silent = true,
				})
			end,
		})

		for idx = 0, 9 do
			map("n", "<leader>" .. idx, function()
				local tags = grapple.tags()
				local selectedTagPath = tags[idx].path
				local filename = vim.fn.fnamemodify(selectedTagPath, ":t")

				-- grapple.select() doesn't work when filename starts from $ 
        -- e.g. tanstack start/router filename convention ($slug.tsx)
				-- But works when the filename is just $ (e.g. $.tsx)
				if filename:sub(1, 1) == "$" then
					local abspath = vim.fn.fnamemodify(selectedTagPath, ":p")
					local bufnr = vim.fn.bufadd(abspath)
					vim.fn.bufload(bufnr)
					vim.api.nvim_set_current_buf(bufnr)
				else
					grapple.select({ index = idx })
				end
			end, { desc = "Grapple select " .. idx })
		end

		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("GrappleAutoFIFO", { clear = true }),
			callback = function()
				local path = vim.api.nvim_buf_get_name(0)

				local ignore = {
					"",
					"gitcommit",
					"grapple",
					"oil",
					"gitrebase",
				}

				if vim.bo.buftype ~= "" or vim.tbl_contains(ignore, vim.bo.filetype) then
					return
				end

				if path:match("^oil://") then
					return
				end

				-- vim.notify(vim.inspect({ path = path, buftype = vim.bo.buftype }), vim.log.levels.DEBUG)

				local tags = grapple.tags() or {}

				if grapple.exists({ path = path }) then
					return
				end

				if #tags >= MAX_TAGS then
					local oldest = tags[1]
					if oldest and oldest.path then
						grapple.untag({ path = oldest.path })
					end
				end

				grapple.tag({ path = path })
			end,
		})
	end,
}
