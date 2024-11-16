return {
    {
        "catppuccin/nvim", 
        lazy = false,
        name = "catppuccin", 
        priority = 100000000,
        config = function()
            vim.cmd.colorscheme "catppuccin-macchiato"
        end
    }
}
