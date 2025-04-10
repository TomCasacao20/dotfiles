local keymap = vim.keymap
local api = vim.api

vim.g.mapleader = " "

keymap.set("n", "<A-k>", ":m .+1<CR>==")
keymap.set("n", "<A-l>", ":m .-2<CR>==")
keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv")

keymap.set("i", "jj", "<Esc>")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set({ "n", "v", "o" }, "j", "h")
keymap.set({ "n", "v", "o" }, "k", "j")
keymap.set({ "n", "v", "o" }, "l", "k")
keymap.set({ "n", "v", "o" }, "ç", "l")
keymap.set({ "n", "v", "o" }, ";", "l")

keymap.set({ "n", "v", "o" }, "<C-w>j", "<C-w>h")
keymap.set({ "n", "v", "o" }, "<C-w>k", "<C-w>j")
keymap.set({ "n", "v", "o" }, "<C-w>l", "<C-w>k")
keymap.set({ "n", "v", "o" }, "<C-w>ç", "<C-w>l")
keymap.set({ "n", "v", "o" }, "<C-w>;", "<C-w>l")

keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "[F]ile[B]rowser" })
