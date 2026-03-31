vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
    transparent_background = true,
})

vim.cmd.colorscheme("catppuccin-macchiato")
