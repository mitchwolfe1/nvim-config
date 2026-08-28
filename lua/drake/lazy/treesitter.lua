local ensure_installed = {
  "c",
  "html",
  "javascript",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "ruby",
  "rust",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  dependencies = { "EdenEast/nightfox.nvim" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({
      install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
    })

    treesitter.install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("drake_treesitter", { clear = true }),
      pattern = "*",
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        local started = pcall(vim.treesitter.start, args.buf, language)
        if not started then
          return
        end

        local has_indents, indent_query = pcall(vim.treesitter.query.get, language, "indents")
        if has_indents and indent_query then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
