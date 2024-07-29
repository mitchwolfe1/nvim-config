
local is_transparent = false 

local default_normal_bg = vim.api.nvim_get_hl_by_name("Normal", true).background
local default_float_bg = vim.api.nvim_get_hl_by_name("NormalFloat", true).background
local default_nc_bg = vim.api.nvim_get_hl_by_name("NormalNC", true).background

function ColorMyPencils(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)
    ToggleTransparency(is_transparent)
end


function ToggleTransparency(toggle)
    if toggle then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    else
        vim.api.nvim_set_hl(0, "Normal", { bg = default_normal_bg })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = default_float_bg })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = default_nc_bg })
    end
end

function ToggleTransparencyKeybind()
    is_transparent = not is_transparent
    ToggleTransparency(is_transparent)
end

function TestFunction()
    vim.api.nvim_set_hl(0, "Normal", { bg = default_normal_bg })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = default_float_bg })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = default_nc_bg })
end

vim.api.nvim_set_keymap('n', '<leader>t', ':lua ToggleTransparencyKeybind()<CR>', { noremap = true, silent = true})

