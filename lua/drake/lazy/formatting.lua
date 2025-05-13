return {
  {
    "nvimtools/none-ls.nvim",
    branch = "main",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting

      null_ls.setup({
        sources = {
          formatting.prettier.with({
            extra_filetypes = { "ruby" },
            prefer_local    = "node_modules/.bin",
          }),
          formatting.black,
          formatting.stylua,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            local aug = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_clear_autocmds({ group = aug, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = aug,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr   = bufnr,
                  filter  = function(fmt_client)
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
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = { "mason.nvim", "nvimtools/none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed      = { "prettier", "black", "stylua" },
        automatic_installation = true,
      })
    end,
  },
}
