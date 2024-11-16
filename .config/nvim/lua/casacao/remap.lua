local keymap = vim.keymap
local api = vim.api

vim.g.mapleader = " "

vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
