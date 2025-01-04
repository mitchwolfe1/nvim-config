return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'EdenEast/nightfox.nvim',
  },
  config = function()
    vim.cmd.colorscheme("carbonfox")
    vim.opt.termguicolors = true
    require('bufferline').setup {
        options = {
            mode = "tabs",
            indicator = {style = "underline"}
        }
    }
  end
}
