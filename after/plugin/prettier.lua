-- Function to format the current file with Prettier
function format_with_prettier()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(buf)

    vim.fn.jobstart({'./node_modules/.bin/prettier', '--plugin=@prettier/plugin-ruby', '--write', filename}, {
        on_exit = function()
            vim.api.nvim_command('checktime')  -- Check if the file has changed and reload
        end,
    })
end

-- Bind the function to <leader>F
vim.api.nvim_set_keymap('n', '<leader>F', ':lua format_with_prettier()<CR>', { noremap = true, silent = true })
