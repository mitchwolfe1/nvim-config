return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "EdenEast/nightfox.nvim",
    },
    config = function()
        require("nvim-tree").setup(
            {
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
                    git_ignored = false
                },
            }
        )
    end
}
