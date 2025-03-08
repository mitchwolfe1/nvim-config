return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
        { "zk", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
