-- options
--------------------------------------------------------------------------------

-- Line numbers
vim.opt.number = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Cursorline
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions
vim.opt.inccommand = 'split'

-- Text wrapping
vim.opt.wrap = true
vim.opt.breakindent = true

-- Tabstops
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'


-- Other
vim.opt.termguicolors = true        -- optionally enable 24-bit colour
vim.opt.scrolloff = 10              -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.confirm = true              -- Adds dialog to fix things
vim.opt.ruler = false               -- Removes the bottom right hand info
vim.opt.laststatus = 3              --This sets the status bar to global so that it doesn't show in buffers
vim.opt.fillchars = { eob = ' ' } -- Gets rid of the ~ end of file chars
vim.opt.showmode = false            -- assumes the status line will show the mode
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus' -- Helps with startup time to wait until nvim initializes
end)
