return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {'EdenEast/nightfox.nvim'},
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "javascript", "html", "python", "typescript", "ruby", "rust"
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true,
       additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
    })
  end
}
