local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rebelot/kanagawa.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('tpope/vim-fugitive')
Plug(
"kylechui/nvim-surround",
{
	['tag'] = '*',
	['do'] = function() require("nvim-surround").setup() end
}) 

vim.call('plug#end')
