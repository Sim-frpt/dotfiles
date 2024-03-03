local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint'
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

local cmp = require('cmp')

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu, menuone, noinsert'
    },
    mapping = cmp.mapping.preset.insert({ 
        ['<C-Space>'] = cmp.mapping.complete(), 
    }),
})
