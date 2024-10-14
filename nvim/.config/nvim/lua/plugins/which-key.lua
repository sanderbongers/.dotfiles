return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<Leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Show keymaps (which-key)",
        },
    },
    opts = {
        spec = {
            { "<Leader>l", "<Cmd>Lazy<CR>", icon = { icon = "󰒲", color = "blue" } },
        }
    }
}
