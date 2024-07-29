-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = false,
    indent_markers = {
      enable = true
    }
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>ff", ":NvimTreeFindFile<CR>")

-- Automatically open nvim-tree when opening a file or creating a new tab
vim.api.nvim_exec([[
  autocmd VimEnter * NvimTreeToggle
  autocmd TabNewEntered * NvimTreeToggle
]], false)

-- To toggle hidden files, Focus on tree and press `H`
