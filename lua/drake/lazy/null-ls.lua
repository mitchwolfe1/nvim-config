return {
  {
    "nvimtools/none-ls.nvim", -- null-ls has been renamed to none-ls
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.rustfmt,  -- Rust formatter
        },
      })
    end,
  },
}

