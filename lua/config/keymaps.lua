local map = vim.keymap.set

-- coding assist
map("n", "mm", "iConsole.WriteLine()<esc>bcib", { desc = "Write line" })
-- map("n", "pp", "iprint(\"\")<esc>bci\"", { desc = "Print" })
map("n", "<space>f", function() vim.lsp.buf.format() end)


--navigating files
map('n', '\\', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-\\>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })


-- Saving file
-- map("n", "<enter><enter>", ":w<enter>", { desc = "JOSHUA" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<space><space>x", ":source %<CR>")
map("n", "<space>x", ":.lua<CR>")
map("v", "<space>x", ":lua<CR>")

-- Run code
map("n", "<enter><enter>", ":!~/.venv/bin/python3 %<enter>", { desc = "JOSHUA" })
-- shift enter will be run but make it so that it runs it correctly depending on what the type of file is

-- USE nightly version then I dont need these vv
map('n', 'grn', vim.lsp.buf.rename)
map('n', 'gra', vim.lsp.buf.code_action)
map('n', 'grr', vim.lsp.buf.references)
map('i', '<C-s>', vim.lsp.buf.signature_help)
