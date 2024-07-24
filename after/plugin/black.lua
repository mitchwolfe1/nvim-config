
-- Function to format the current file with Black
function format_with_black()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(buf)

    vim.fn.jobstart({'isort', filename}, {
        on_exit = function()
            -- After isort completes, run black
            vim.fn.jobstart({'black', filename}, {
                on_exit = function()
                    vim.api.nvim_command('checktime')  -- Check if the file has changed and reload
                end,
            })
        end,
    })
end

-- Set up an autocmd to format on save
vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre *.py lua format_with_black()
augroup END
]])

