vim.g.loaded_netrw = 1            -- disables netrw (built in file explorer)
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.o.number = true               -- adds line numbers
vim.o.termguicolors = true        -- optionally enable 24-bit colour
vim.o.scrolloff = 10              -- Minimal number of screen lines to keep above and below the cursor.
vim.o.confirm = true              -- Adds dialog to fix things
vim.o.ruler = false               -- Removes the bottom right hand info
vim.o.laststatus = 3              --This sets the status bar to global so that it doesn't show in buffers
vim.o.list = true                 -- Shows a character for trailing whitespace, etc
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = { eob = ' ' } -- Gets rid of the ~ end of file chars
vim.o.cursorline = true           -- Coloring the line number but not entire line
vim.o.cursorlineopt = 'number'
vim.o.showmode = false            -- assumes the status line will show the mode
-- vim.o.statuscolumn = "%s%C%3l\ ▍"
-- vim.o.signcolumn = 'yes'
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- Helps with startup time to wait until nvim initializes
end)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<leader>e', ':Neotree<cr>', { desc = 'Open file explorer' })
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end)


-- [[ Basic Autocommands ]] (vim command or lua function executed when an event is triggered)
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]] (makes it easy to install other plugins)
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)   -- Puts lazy in runtime path for neovim


-- [[ install plugins using the lazy setup ]]
-- Can be just a string 'USER/repo' or a table optionally with a config funtion
require("lazy").setup({
  'NMAC427/guess-indent.nvim',
  { import = "plugins" }, -- installs plugins from the files in the plugins folder
})

require("highlights").setup();
require("statuscolumn").setup();

vim.diagnostic.config({
  -- Virtual text options
  virtual_text = {
    enabled = true,
    source = "if_many", -- Show source name when multiple sources exist
    spacing = 4,        -- Spaces before virtual text
    prefix = "●",       -- Character to show before text
    severity = { min = vim.diagnostic.severity.HINT }, -- Minimum severity to show
  },

  -- Sign column (gutter) configuration
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN]  = "▲",
      [vim.diagnostic.severity.HINT]  = "⚑",
      [vim.diagnostic.severity.INFO]  = "»",
    }
  },

  -- Underline problematic text
  underline = true,

  -- Update diagnostics in insert mode
  update_in_insert = true,

  -- Floating window settings for hover diagnostics
  float = {
    source = "always",  -- Show diagnostic source
    border = "rounded", -- Window border style
    header = "",        -- Custom header text
    prefix = "",        -- Custom prefix for each diagnostic
    focusable = false,  -- Whether window can be focused
  },
  
  -- Severity sorting (highest severity first)
  severity_sort = true,
})
