vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "1/2 page down then center view" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "1/2 page up then center view" })

-- Center screen when searching
keymap.set("n", "n", "nzzzv", { desc = "Center screen when finding" })
keymap.set("n", "N", "Nzzzv", { desc = "Center screen when finding" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "vscode alt + down arrow" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "vscode alt + up arrow" })

keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selected without losing copied text" })
keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copying" })

keymap.set("n", "<leader>ref", vim.lsp.buf.rename, { desc = "Refactor like vscode F2" })
