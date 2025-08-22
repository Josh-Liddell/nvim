-- autocmd
--------------------------------------------------------------------------------
-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Restore Cursor
vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    vim.cmd("set guicursor=a:ver25-blinkwait700-blinkon400-blinkoff250")
  end,
})
