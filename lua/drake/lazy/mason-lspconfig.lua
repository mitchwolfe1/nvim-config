-- ~/.config/nvim/lua/drake/lazy/mason-lspconfig.lua
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- 1) Bootstrap Mason
    require("mason").setup()

    -- 2) The LSP servers you want:
    local servers = {
      "lua_ls",
      "solargraph",
      "rust_analyzer",
      -- add any others here…
    }
    require("mason-lspconfig").setup {
      ensure_installed = servers,
    }

    -- 3) Capabilities for nvim-cmp / LSP
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- 4) A real on_attach: disable Solargraph formatting,
    --    but still set up your usual keymaps, etc.
    local function on_attach(client, bufnr)
      if client.name == "solargraph" then
        -- turn off Solargraph’s formatters entirely
        client.server_capabilities.documentFormattingProvider      = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end

      -- <– your normal keymaps go here –>
      local bufmap = function(lhs, rhs)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr })
      end
      bufmap("gd", vim.lsp.buf.definition)
      bufmap("K",  vim.lsp.buf.hover)
      -- …etc…
    end

    -- 5) Loop and register each server with the new vim.lsp.config API
    for _, name in ipairs(servers) do
      local opts = {
        on_attach   = on_attach,
        capabilities = capabilities,
      }

      if name == "lua_ls" then
        opts.settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        }
      end

      -- Use new nvim 0.11+ API
      vim.lsp.config[name] = opts
      vim.lsp.enable(name)
    end
  end,
}
