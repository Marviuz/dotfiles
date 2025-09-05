vim.g.mapleader = " "

local map = require("marviuz.utils.map")

map("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

map("n", "<C-d>", "<C-d>zz", { desc = "1/2 page down then center view" })
map("n", "<C-u>", "<C-u>zz", { desc = "1/2 page up then center view" })

-- Center screen when searching
map("n", "n", "nzzzv", { desc = "Center screen when finding" })
map("n", "N", "Nzzzv", { desc = "Center screen when finding" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "vscode alt + down arrow" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "vscode alt + up arrow" })

map("x", "<leader>p", '"_dP', { desc = "Paste over selected without losing copied text" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copying" })

map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace current selected word in current buffer" }
)
