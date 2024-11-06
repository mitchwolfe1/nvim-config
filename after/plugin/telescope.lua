local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>ps', function()
--    builtin.grep_string({ search = vim.fn.input("Grep > ") });
--end)
vim.cmd [[
  highlight TelescopeNormal guibg=none
  highlight TelescopeBorder guibg=none
]]


vim.cmd [[
  highlight TelescopePromptPrefix guifg=#FFFFFF guibg=none
  highlight TelescopePromptNormal guibg=none
  highlight TelescopePromptBorder guibg=none
  highlight TelescopeResultsTitle guibg=none guifg=#FFFFFF
  highlight TelescopePreviewTitle guibg=none guifg=#FFFFFF
  highlight TelescopePromptTitle guibg=none guifg=#FFFFFF
]]

