-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.ruler = false -- Removes the bottom right hand info

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- print("Hello Joshua, welcome to Nvim")

require("config.lazy")
require("config.keymaps")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
-- This is how I could change the colors of certain things
-- vim.cmd [[hi @function.builtin guifg=pink]]


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



-- MyCoolFunction = function() print "Hello" end