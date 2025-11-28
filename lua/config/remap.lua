vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
