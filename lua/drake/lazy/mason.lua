return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall", "MasonLog" },
    opts = {},
    config = function(_, opts)
        require("mason").setup(opts)
    end,
}
