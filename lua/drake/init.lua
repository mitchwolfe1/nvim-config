vim.g.mapleader = " "

if vim.env.SSH_TTY then
    vim.g.clipboard = "osc52"
end

require("drake.lazy_init")
require("drake.remap")
require("drake.set")
