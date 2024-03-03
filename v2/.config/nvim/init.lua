require("sim")

-- VIM OPTIONS

-- Color scheme
vim.cmd.colorscheme('kanagawa')

vim.o.termguicolors = true

-- Set line numbers and make them relative to cursor position
vim.o.number = true
vim.o.relativenumber = true

-- Indent settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

-- Disable "visual" line wrapping
vim.o.wrap = false

vim.o.scrolloff = 8

-- Faster update time of the swap file
vim.o.updatetime = 50

vim.o.colorcolumn = "80"
