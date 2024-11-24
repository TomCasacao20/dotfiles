return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100000000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })
        vim.cmd.colorscheme "catppuccin-macchiato"
    end
}
