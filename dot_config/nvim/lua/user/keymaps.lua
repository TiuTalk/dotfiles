local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "<Leader><Leader>", ":noh<CR>", opts)

-- Reload file
keymap("n", "<Leader>r", ":source %<CR>", opts)

-- Buffer manipulation
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<Leader>d", ":bdelete<CR>", opts)

-- Git blame
keymap("n", "<Leader>gb", ":GitBlameToggle<CR>", opts)
-- keymap("n", "<Leader>gu", ":GitBlameOpenCommitURL<CR>", opts)

-- Telescope
keymap("n", "<Leader>p", ":Telescope find_files<CR>", opts)
keymap('n', '<C-]>', ":Telescope lsp_definitions<CR>", opts)

-- LSP
keymap("n", "<Leader>f", ":Format<CR>", opts)

-- keymap('n', '<C-]>', vim.lsp.buf.definition, opts)
-- keymap("n", "<Leader>t", "<CMD>TestNearest<CR>", opts)
