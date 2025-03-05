-- Move blocks up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move up or down half a page (keep cursor in middle)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over something without modifying register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Tab control
vim.keymap.set("n", "<C-,>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-.>", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

-- Split control
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")
vim.keymap.set("n", "<leader>hs", ":split<CR>")

-- LSP
vim.keymap.set("n", "<leader>i", '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set("n", "<leader>hi", '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Exit terminal mode with Escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
