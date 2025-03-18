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

-- allows to move text when higlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When appending bottom line to current, keep cursor in its position
vim.keymap.set("n", "J", "mzJ`z")

-- Use leader y to copy into the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

-- Use leader to delete into void register (won't replace what's in the yank register
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>d", "\"_d")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Quickfix related motions
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")


-- Helpful lsp mappings
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
