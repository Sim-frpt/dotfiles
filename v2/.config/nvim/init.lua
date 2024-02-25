require("sim")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Declare the list of plugins.

-- " Color theme
Plug('rebelot/kanagawa.nvim')

vim.call('plug#end')

-- " VIM OPTIONS

-- " Color scheme
vim.cmd.colorscheme('kanagawa')

-- " Set line numbers and make them relative to cursor position
vim.o.number = true
vim.o.relativenumber = true

-- " Briefly jump to the matching brace/paren/bracket when inserting text

vim.o.showmatch = true
