local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rebelot/kanagawa.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('tpope/vim-fugitive')
Plug("kylechui/nvim-surround",
{
    ['tag'] = '*',
    ['do'] = function() require("nvim-surround").setup({}) end
}
) 
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- LSP config section

-- LSP Support
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')

Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v3.x' })

vim.call('plug#end')
