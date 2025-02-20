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
-- Do :highlight to see the current applied highlights

-- Set the colorscheme to my colorscheme plugin
vim.cmd [[colorscheme tokyonight]]


-- Customze the syntax highlighting with the help of Tree-sitter

-- vim.cmd [[hi @function.builtin guifg=pink]]

-- vim.cmd [[hi Conditional guifg=red]] -- Customize to the blue of your choice
vim.cmd [[hi Number guifg=#fbb2e5]]
-- vim.cmd [[hi Number guifg=#e04b31]]
-- -- Override Tree-sitter highlighting with cool shades of blue
-- vim.cmd [[hi @keyword guifg=red]] -- Keywords (e.g., def, if, else)
-- vim.cmd [[hi @function guifg=#5fa0d1]]         -- Functions
-- vim.cmd [[hi @function.builtin guifg=#4f9dc9]] -- Built-in functions (e.g., print)
-- vim.cmd [[hi @variable guifg=#1e4f82]] -- Variables
-- vim.cmd [[hi @variable.builtin guifg=#4a8e9b]] -- Built-in variables (e.g., True, None)
-- vim.cmd [[hi @class guifg=#3a7ca3]]            -- Classes
-- vim.cmd [[hi @method guifg=#4188b7]]           -- Methods
-- vim.cmd [[hi @string guifg=#b2c0fb]] -- Strings
vim.cmd [[hi @string guifg=#8d92e5]] -- Strings
-- vim.cmd [[hi @comment guifg=#8bb5d5]] -- Comments
-- vim.cmd [[hi @number guifg=#4a90e2]]           -- Numbers
-- vim.cmd [[hi @operator guifg=#5390b8]]         -- Operators (+, -, *, /)
-- vim.cmd [[hi @type guifg=#5c87c1]]             -- Types (e.g., int, str)
-- vim.cmd [[hi @constructor guifg=#4e9bb5]]      -- Constructors
-- vim.cmd [[hi @label guifg=#5d99c6]]            -- Labels (e.g., in switch statements)



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
