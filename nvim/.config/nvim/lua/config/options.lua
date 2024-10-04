local vim = vim
local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

g.mapleader = " "
g.maplocalleader = "\\"

-- Synchronize with system clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamed,unnamedplus"

-- Highlight current line
opt.cursorline = true

-- Block style cursor in all modes
opt.guicursor = ""

-- Case insensitive search
opt.ignorecase = true

-- Print line numbers
opt.number = true

-- Print line numbers relative to the current line
opt.relativenumber = true

-- Autoindent when starting a new line
opt.smartindent = true

-- Splitting a window will put the new window below the current one
opt.splitbelow = true

-- Splitting a window will put the new window right of the current one
opt.splitright = true

-- Show filename in window title
opt.title = true

-- Complete first match and list all matches
opt.wildmode = "list:full"

-- Enable fzf in Vim
opt.rtp:append("/usr/local/opt/fzf")

-- Enable mouse scrolling
keymap.set('n', '<ScrollWheelDown>', 'j', { noremap = true, silent = true })
keymap.set('n', '<ScrollWheelUp>', 'k', { noremap = true, silent = true })
