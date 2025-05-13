-- lua/drake/lazy/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  cmd  = { "LspInfo", "LspInstall", "LspStart", "LspStop" },
  event = "LspAttach",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    -- example on_attach & capabilities omitted for brevity...
  end,
}
