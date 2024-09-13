return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true
                }
            })
        end,
    }
}
