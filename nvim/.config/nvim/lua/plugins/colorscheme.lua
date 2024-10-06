return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            on_colors = function(c)
                c.bg = "#19191d"
                c.bg_dark = "#1e2030"
                c.bg_float = "#1e2030"
                c.bg_popup = "#1e2030"
                c.bg_sidebar = "#1e2030"
                c.bg_statusline = "#1e2030"
            end,
            on_highlights = function(hl, c)
                hl.CursorLine = {
                    bg = "#21232d"
                }
            end
        })
        vim.cmd("colorscheme tokyonight")
    end
}
