require("config.lazy")

local vim = vim

-- Remove background color to use theterminal's background
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
--     end
-- })

-- Synchronize with system clipboard
vim.opt.clipboard:append("unnamed,unnamedplus")

-- Block style cursor in all modes
vim.opt.guicursor = ""

-- Case insensitive search
vim.opt.ignorecase = true

-- Autoindent when starting a new line
vim.opt.smartindent = true

-- Complete first match and list all matches
vim.opt.wildmode = "list:full"

-- Enable mouse scrolling in iTerm2
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', 'k', { noremap = true, silent = true })

-- Enable fzf in Vim
vim.opt.rtp:append("/usr/local/opt/fzf")
