-- Setup <Leader> and <LocalLeader> keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Synchronize with system clipboard
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Highlight current line
vim.opt.cursorline = true

-- Block style cursor in all modes
vim.opt.guicursor = ""

-- Case insensitive search
vim.opt.ignorecase = true

-- Print line numbers
vim.opt.number = true

-- Print line numbers relative to the current line
vim.opt.relativenumber = true

-- Autoindent when starting a new line
vim.opt.smartindent = true

-- Splitting a window will put the new window below the current one
vim.opt.splitbelow = true

-- Splitting a window will put the new window right of the current one
vim.opt.splitright = true

-- Show filename in window title
vim.opt.title = true

-- Complete first match and list all matches
vim.opt.wildmode = "list:full"