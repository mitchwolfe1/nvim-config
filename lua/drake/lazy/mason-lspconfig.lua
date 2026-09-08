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
      "pyright",
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

      -- rustfmt is provided through rust-analyzer. none-ls removed its
      -- unmaintained rustfmt builtin, so keep format-on-save on the LSP path.
      if client.name == "rust_analyzer" and client:supports_method("textDocument/formatting", bufnr) then
        local group = vim.api.nvim_create_augroup("RustLspFormatting", { clear = false })
        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              filter = function(fmt_client)
                return fmt_client.name == "rust_analyzer"
              end,
            })
          end,
        })
      end

      -- <– your normal keymaps go here –>
      local bufmap = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
      end
      bufmap("gd", vim.lsp.buf.definition, "Go to definition")
      bufmap("K", vim.lsp.buf.hover, "Show hover documentation")
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
