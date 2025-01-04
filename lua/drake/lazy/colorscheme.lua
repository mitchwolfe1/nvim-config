return {
    "EdenEast/nightfox.nvim",
    config = function()
        vim.cmd.colorscheme("carbonfox")
        vim.opt.termguicolors = true
        require('nightfox').setup {
            options = {dim_inactive = true}
        }
    end
} -- lazy
