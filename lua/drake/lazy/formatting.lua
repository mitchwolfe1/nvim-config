return {
  -- 1) null-ls itself (unchanged)
  {
    "nvimtools/none-ls.nvim",
    branch       = "main",
    dependencies = { "nvim-lua/plenary.nvim" },
    event        = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls   = require("null-ls")
      local formatting = null_ls.builtins.formatting
      null_ls.setup({
        sources = {
          formatting.prettier.with({
            extra_filetypes = { "ruby" },
            prefer_local    = "node_modules/.bin",
          }),
          formatting.black,
          formatting.stylua,
          formatting.rustfmt,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            local aug = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_clear_autocmds({ group = aug, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group    = aug,
              buffer   = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  filter = function(fmt_client)
                    return fmt_client.name == "null-ls"
                  end,
                })
              end,
            })
          end
        end,
      })
    end,
  },

  -- 2) Mason itself, loaded eagerly so registry:new() is always available
  {
    "williamboman/mason.nvim",
    -- you can still lazy-load on these events if you want,
    -- but the key is to call setup() before mason-null-ls
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()
    end,
  },

  -- 3) mason-null-ls, with the *correct* dependency
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed       = { "prettier", "black", "stylua", "rustfmt" },
        automatic_installation = true,
      })
    end,
  },
}

