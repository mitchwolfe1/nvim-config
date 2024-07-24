require("mitch.remap")
require("mitch.set")
require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'solargraph'},
})
-- Setup LSPConfig with Pyright
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.solargraph.setup{}
--require'lspconfig'.pyright.setup{}
