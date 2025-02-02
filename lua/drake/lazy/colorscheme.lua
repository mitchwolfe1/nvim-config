return {
    "EdenEast/nightfox.nvim",
    config = function()
        vim.cmd.colorscheme("carbonfox")
        vim.opt.termguicolors = true
        require('nightfox').setup {
            options = { dim_inactive = true },
            groups = {
                all = {
                    Visual = { bg = "#835faf", fg = "NONE" } -- Change to your preferred color
                }
            }
        }
    end
} -- lazy
