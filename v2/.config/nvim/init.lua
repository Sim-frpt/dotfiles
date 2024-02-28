require("sim")

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



