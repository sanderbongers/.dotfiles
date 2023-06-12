vim.api.nvim_create_autocmd({"ColorScheme"}, {
    pattern = {"*"},
    -- Transparent background, regardless of theme
    command = "highlight Normal guibg=NONE ctermbg=NONE"
})

-- Synchronize with system clipboard
vim.opt.clipboard:append("unnamed,unnamedplus")

-- Block style cursor in all modes
vim.opt.guicursor = ""

-- Complete first match and list all matches
vim.opt.wildmode = "list:full"

-- Enable mouse scrolling in iTerm2
vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "j", {})
vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "k", {})
