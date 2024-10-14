-- Setup <Leader> and <LocalLeader> keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Synchronize with system clipboard
vim.schedule(function()
    vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
end)

-- Highlight current line
vim.opt.cursorline = true

-- Block style cursor in all modes
vim.opt.guicursor = ""

-- Case insensitive search, unless uppercase is used deliberately
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Print line numbers
vim.opt.number = true

-- Print line numbers relative to the current line
vim.opt.relativenumber = true

-- Splitting a window will put the new window below the current one
vim.opt.splitbelow = true

-- Splitting a window will put the new window right of the current one
vim.opt.splitright = true

-- Decrease the time to wait for a mapped sequence to complete
vim.opt.timeoutlen = 500

-- Show filename in window title
vim.opt.title = true

-- Complete first match and list all matches
vim.opt.wildignorecase = true
vim.opt.wildmode = "list:full"
