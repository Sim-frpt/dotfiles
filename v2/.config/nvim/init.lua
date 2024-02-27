require("sim")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rebelot/kanagawa.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

vim.call('plug#end')

-- VIM OPTIONS

-- Color scheme
vim.cmd.colorscheme('kanagawa')

-- Set line numbers and make them relative to cursor position
vim.o.number = true
vim.o.relativenumber = true

-- Briefly jump to the matching brace/paren/bracket when inserting text
vim.o.showmatch = true

-- Copy from vim inside system clipboard
vim.o.clipboard = "unnamedplus"



