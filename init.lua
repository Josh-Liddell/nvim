-- print("Hello Joshua, welcome to Nvim")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.ruler = false -- Removes the bottom right hand info

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- For python development
vim.g.python3_host_prog = '~/.venv/bin/python3'


-- Load my plugins and special keymaps
require("config.lazy")
require("config.keymaps")

vim.opt.shiftwidth = 4 --How big a tab is, though settings can also be changed per filetype
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3 --This sets the status bar to global so that it doesn't show in buffers


-- COLORS

-- This is how I could change the colors of certain things
-- vim.cmd [[hi @function.builtin guifg=blue]]
vim.cmd [[colorscheme tokyonight]]



-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- This restores a blinking cursor when I exit
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.cmd("set guicursor=a:ver25-blinkwait700-blinkon400-blinkoff250")
  end,
})

-- MyCoolFunction = function() print "Hello" end
