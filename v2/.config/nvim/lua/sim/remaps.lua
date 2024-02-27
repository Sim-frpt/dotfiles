vim.g.mapleader = ","
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Center the view when travelling half a screen up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center the view when searching something
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- This allows to keep the current clipboard item active when replacing text
vim.keymap.set("x", "<leader>p", "\"_dp")


