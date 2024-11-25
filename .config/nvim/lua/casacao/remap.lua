local keymap = vim.keymap
local api = vim.api

vim.g.mapleader = " "

keymap.set({ "n", "v", "o" }, "j", "h")
keymap.set({ "n", "v", "o" }, "k", "j")
keymap.set({ "n", "v", "o" }, "l", "k")
keymap.set({ "n", "v", "o" }, "ç", "l")
keymap.set({ "n", "v", "o" }, ";", "l")

vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
