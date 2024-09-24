require("config.lazy")

local vim = vim
local a = vim.api
local o = vim.opt

-- Synchronize with system clipboard
o.clipboard:append("unnamed,unnamedplus")

-- Block style cursor in all modes
o.guicursor = ""

-- Case insensitive search
o.ignorecase = true

-- Enable mouse support in all modes
o.mouse = a

-- Autoindent when starting a new line
o.smartindent = true

-- Complete first match and list all matches
o.wildmode = "list:full"

-- Enable mouse scrolling in iTerm2
a.nvim_set_keymap('n', '<ScrollWheelDown>', 'j', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<ScrollWheelUp>', 'k', { noremap = true, silent = true })

-- Enable fzf in Vim
o.rtp:append("/usr/local/opt/fzf")
