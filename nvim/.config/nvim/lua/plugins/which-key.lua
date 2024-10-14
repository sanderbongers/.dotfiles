return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<Leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Keymaps (which-key)",
        },
    },
    opts = {
        spec = {
            { "<Leader>l", "<Cmd>Lazy<CR>", icon = { icon = "󰒲", color = "blue" } },
        }
    }
}
