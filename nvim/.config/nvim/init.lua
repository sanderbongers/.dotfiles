require("config.lazy")

local vim = vim
local a = vim.api
local o = vim.opt

-- Synchronize with system clipboard
o.clipboard:append("unnamed,unnamedplus")

-- Highlight current line
o.cursorline = true

-- Block style cursor in all modes
o.guicursor = ""

-- Case insensitive search
o.ignorecase = true

-- Print line numbers, relative to the current line
o.number = true
o.relativenumber = true

-- Autoindent when starting a new line
o.smartindent = true

-- Splitting a window will put the new window below or right of the current one
o.splitbelow = true
o.splitright = true

-- Show filename in window title
o.title = true

-- Complete first match and list all matches
o.wildmode = "list:full"

-- Enable mouse scrolling in iTerm2
a.nvim_set_keymap('n', '<ScrollWheelDown>', 'j', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<ScrollWheelUp>', 'k', { noremap = true, silent = true })

-- Enable fzf in Vim
o.rtp:append("/usr/local/opt/fzf")
